import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_game/logic/game_contraller.dart';
import 'package:memory_game/logic/game_cubide/on_click_card.dart';
import 'package:memory_game/logic/game_theams_config.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/logic/mylibs/modulscreateor.dart';
import 'package:memory_game/logic/mylibs/stagesmodule.dart';
import 'package:memory_game/logic/stageConfigratoin.dart';
import 'package:memory_game/logic/values.dart';
import 'package:memory_game/ui/widgets/alarm_containt/unsuffesiont_fund.dart';
import 'package:memory_game/ui/widgets/pay_alarm_dailog.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../procject_metiods.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameStatus> {
  List<String> imagesvalues = [];

  InterstitialAd? _interstitialAd;
  RewardedAd? rewardedAd ;
  GameTheameConfig? gameTheameConfig ;
  GameCubit() : super(GameStatus());
   GameController gameConraller = GameController.init();
  StagesModule stagesManager = StagesModule();
late  BuildContext  context ;
  late SharedPreferences sharedPreferences;
  bool isNoAction = true;
  int helpAddTryis = 20;
  int helpAddCurrectCard = 20;
  bool isAppRated = false ;
  // int _cardnum = 2;
  int gamelevle = 31;
  // int _lastno = 0;
  // int _lastitemno = 10;
  List<String> valuesCards = [];
  List<CardModule> cards = [];
  List<String> imagschosing = [];
  // int _imagelevelRandm = 0;
  // int _imageArray = 0 ;
  int defcultLevel = 0;
  // int colomesno = 2;
  int _counter = 0;
  CardModule? card1, card2; // tra
  ONClickCard onClickCard = ONClickCard();
  int _defultlevel = 1;
  int _defulthelpersAdd = 20;
  int _defulthelpersCurrect = 10;
  PlaySound play = PlaySound();
  late StageConfigs stageConfigs;


  Future loadInitAds() async {
    await InterstitialAd.load(
        adUnitId: '$initAds',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this._interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));

  }
Future    loadRewardedAds() async {

    await      RewardedAd.load(
        adUnitId: '$rewardedAds',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this.rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));

}

  void rewardShow(){
    rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      // Reward the user for watching an ad.
    });
  }
  void  getRewards(int state ){
    switch (state){
      case 1:  return  ;
      case 2:  helpAddPay(5)  ; break ;
      case 3:   helpcurectPay(2)  ; break ;
      default: return  ;

    }
  }
void initRewardedAdsLesteners(int state ){
    if (rewardedAd!=null ){
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad)
        async  { getRewards(state) ; await loadRewardedAds(); },
        onAdDismissedFullScreenContent: (RewardedAd ad) async  {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          await loadRewardedAds() ;
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) async {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          await  loadRewardedAds();
        },
        onAdImpression: (RewardedAd ad) async { await loadRewardedAds() ; },
      );
    }
}
  void gameInit(BuildContext context ) async {

    await stagesManager.laodnig();
 this.  context = context ;
    await _loadSavedData();
    stageConfigs = StageConfigs(gamelevle);
    gameTheameConfig = GameTheameConfig();
    gameTheameConfig!.getBackgrund() ;
    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
       );

    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    play.playStart();
    isNoAction = false;
     await loadInitAds();
    await loadRewardedAds();
    _checkGameRated() ;
    emit(GameLoading());
    emit(GameStart());
  }
_checkGameRated(){
   if (gamelevle%10 == 0 ){
   if (! isAppRated) {
     emit(RateGame());
   }
   }
}
  Future showInitAds() async  {
    if (_interstitialAd != null) {
      emit(GameLoading());
      return  _interstitialAd!.show();
    }else {  loadInitAds(); }
  }

  void gameRestart() async {
    await _loadSavedData();
    await loadInitAds();
    await loadRewardedAds();
    gameTheameConfig = GameTheameConfig();
    gameTheameConfig!.getBackgrund() ;
    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
         );

    // imagesvalues.clear() ;
    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    isNoAction = false;
    emit(GameLoading());
    Timer(Duration(milliseconds: 100), () {
      _counter = 0;
      play.playStart();
      emit(GameStart());
      emit(AttemetNotLow());
    });
    await  showInitAds();

  }

  void gameNextLevel() async {
    gameTheameConfig = GameTheameConfig();
    gameTheameConfig!.getBackgrund() ;
    await _loadSavedData();
    stageConfigs = StageConfigs(gamelevle);
    if (gamelevle%3 == 0 ){
    showInitAds();}
    await loadInitAds();
     await loadRewardedAds();
    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
        );

    // imagesvalues.clear() ;
    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    isNoAction = false;
    _checkGameRated() ;
    emit(GameLoading());
    Timer(Duration(milliseconds: 100), () {
      _counter = 0;
      play.playStart();
      emit(GameStart());
    });
  }

  void clik(CardModule card, int i) async {
    // gameConraller.trayes--;
    isNoAction = true;
    emit(CardRotat());
    cards[i].isclicked = true;
    cards[i].result = IS_CHOSSED;
    _counter++;
    await play.playClick();
    Timer(Duration(milliseconds: 500), () async {
      if (_counter == 2) {
        card2 = cards[i];
        emit(WaitToResult());

        Timer(Duration(milliseconds: 500), () async {
          if (_matching(card1!.imagesv, card2!.imagesv)) {
            _currect();
            _counter = 0;
            gameConraller.scors = gameConraller.scors + 2;
            await play.playCurrect();
            emit(ResultCurrect());
          } else {
            await play.playWrong();
            _warng();
            _counter = 0;
            gameConraller.trayes = gameConraller.trayes - 2;
            emit(ResultWrong());
          }
        });
      } else {
        card1 = cards[i];
        isNoAction = false;
        emit(ClickedCard1());
      }
    });
  }

  void helpcurect() {
    if ( helpAddCurrectCard <= 0) {
      helpAddCurrectCard = 0 ;
     showDialog(context: context , builder:(c)=>AlarmDialog(containt:ContentUnsuffes(state:3 ,gameCubit: this,), title: "not found",playsound: PlaySound().playwrang, backgruod: gameTheameConfig!.dailogcolor!,) ) ;

   return ;
    }else {
    helpAddCurrectCard--;
    sharedPreferences.setInt(
        sharedhelpcurrect,  helpAddCurrectCard);

    if (_counter == 1) {
      String s = card1!.imagesv;
      var cardscurrect =
      cards.where((element) => element.imagesv == s).toList();

      cards[cardscurrect[0].cardno].result = IS_CHOSSED;
      cards[cardscurrect[1].cardno].result = IS_CHOSSED;
      card1 = cards[cardscurrect[0].cardno];
      card2 = cards[cardscurrect[1].cardno];
      play.playhelpcurrec();
      emit(HelpCorroct());
      Timer(Duration(milliseconds: 500), () {
        _currect();
        _counter = 0;

        gameConraller.scors = gameConraller.scors + 2;
        emit(ResultCurrect());
      });
    }
  }}

  void helpcurectPay(int v) {
      helpAddCurrectCard = helpAddCurrectCard + v;
    sharedPreferences.setInt(sharedhelpcurrect, helpAddCurrectCard);
    emit(HelpCorroctPued());
  }

  void helpAdd() {
    if (  helpAddTryis <= 0) {
      helpAddTryis = 0 ;
      showDialog(context: context , builder:(c)=>AlarmDialog(containt:ContentUnsuffes(state:2 ,gameCubit:  this,),backgruod: gameTheameConfig!.dailogcolor! ,  title: "not found" ,  playsound:  PlaySound().playwrang,  )  ) ;
return ;
    }else {
    gameConraller.trayes = gameConraller.trayes + 10;
    helpAddTryis = helpAddTryis - 1;
    sharedPreferences.setInt(sharedhelpadd, helpAddTryis);

    play.playhelpAdd();
    emit(HelpAdd());}
  }

  void helpAddPay(int value) {
    helpAddTryis = helpAddTryis + value;
    sharedPreferences.setInt(sharedhelpadd, helpAddTryis);

    emit(HelpAddPayed());
  }

  void resultDone(CardModule c) {
    if (cards[c.cardno].result == MATCHED) {
      isNoAction = false;
      emit(ResultDone());
      return;
    }
    cards[c.cardno].result = NO_CHANCH;
    isNoAction = false;
    emit(ResultDone());
  }

  dynamic _getDatafromjson(Cell c) {
    return stagesManager.dataTable[gamelevle - 1].getvalue(c);
  }

  bool _matching(String c, String c1) {
    return c == c1;
  }
void checkIfAttempetIsLow(){
 if ( gameConraller.trayes <=4){
   play.playhelpAdd();

   emit (AttemetLow());

 } else {
   emit (AttemetNotLow());

 }
}
  void _warng() {
    card1!.isclicked = false;
    card2!.isclicked = false;
    card1!.result = WRONG_CHOOSe;
    card2!.result = WRONG_CHOOSe;
  }

  void _currect() {
    card1!.isclicked = false;
    card2!.isclicked = false;
    card1!.result = MATCHED;
    card2!.result = MATCHED;
  }

  Future loadShardPrefrance() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void storeClosed() {
    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
      );
    emit(StoreClosed());
  }

  Future loadSavedDataWithoutinit() async {
    gamelevle = sharedPreferences.getInt(sharedStages) ?? _defultlevel;
    helpAddTryis = sharedPreferences.getInt(sharedhelpadd) ?? _defulthelpersAdd;
    helpAddCurrectCard =
        sharedPreferences.getInt(sharedhelpcurrect) ?? _defulthelpersCurrect;
  }

  Future _loadSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    gamelevle = sharedPreferences.getInt(sharedStages) ?? _defultlevel;
    helpAddTryis = sharedPreferences.getInt(sharedhelpadd) ?? _defulthelpersAdd;
    helpAddCurrectCard = sharedPreferences.getInt(sharedhelpcurrect) ?? _defulthelpersCurrect;
  isAppRated = sharedPreferences.getBool(sharedRateApp) ?? false ;

  }

  int _settryies(int cardno) {
    return cardno * 2 - defcultLevel * 2;
  }

  void _randomchosing() {
    int _lastno = gameConraller.lastitemno;
    Random randomimage = new Random();
    Random randomplace = new Random();
    print(imagesvalues.length.toString());
    cards.clear();
    imagschosing.clear();

    double imgerequscount = gameConraller.cardnum / 2;
    int randomNumber = randomimage.nextInt(5);
    for (int i = 0; i < imgerequscount; i++) {
      _lastno = _lastno + randomNumber + 1;
      if (_lastno > imagesvalues.length - 1) {
        _lastno = 0;
      }
      imagschosing.add(imagesvalues[_lastno]);
    }

    List<Map<int, String>> cardprocess2 = <Map<int, String>>[];
    List<String> cardprocess = <String>[];
    int i2 = 0;
    int ivalue = 0;
    for (int i = 0; i < gameConraller.cardnum; i++) {
      cardprocess.add(imagschosing[ivalue]);
      cardprocess2.add({i: imagschosing[ivalue]});
      if (i % 2 != 0) {
        ivalue++;
      }
      print(cardprocess[i]);
    }
    print(cardprocess);
    int cardsl = cardprocess.length;
    for (int i = 0; i < imagschosing.length; i++) {
      int r1 = randomplace.nextInt(cardprocess.length);

      cards.add(CardModule(cardprocess[r1], r1));
      cardprocess.remove(cardprocess[r1]);

      int r2 = randomplace.nextInt(cardprocess.length);
      cards.add(CardModule(cardprocess[r2], r2));
      cardprocess.remove(cardprocess[r2]);
    }
    for (int i = 0; i < cards.length; i++) {
      cards[i].cardno = i;
      cards[i].result = STARTED;
      print('${cards[i].imagesv}  noms  ${cards[i].cardno}');
    }
    print("card ${gameConraller.cardnum} colums ${gameConraller.colomesno}");
  }

  double aspectretio() {
    switch (gameConraller.colomesno) {
      case 2:
        if (gameConraller.cardnum == 6) {
          return 1.3;
        } else {
          return 1.6;
        }
      case 3:
        return 1.2;
      case 4:
        switch (gameConraller.cardnum) {
          case 20:
            return 1.0;
          case 24:
            return 1.1;
          case 28:
            return 1.75;
        }
    }
    return 1.30;
  }

  double fontsize() {
    switch (gameConraller.colomesno) {
      case 2:
        return 42.sp;
      case 3:
        return 30.sp;
      case 4:
        return 20.sp;
    }
    return 10;
  }

  void switchGameOver() {
    bool isw = gameConraller.isGameWin();
    if (isw) {
      emit(Winner());
    }
    if (gameConraller.isGameLoss()) {
      emit(Losser());
    }
  }


}
