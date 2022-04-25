import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_contraller.dart';
import 'package:memory_game/logic/game_cubide/on_click_card.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/logic/mylibs/modulscreateor.dart';
import 'package:memory_game/logic/mylibs/stagesmodule.dart';
import 'package:memory_game/logic/stageConfigratoin.dart';
import 'package:memory_game/logic/values.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../procject_metiods.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameStatus> {

  List<String>imagesvalues=[];
  GameCubit() : super(GameStatus());
  late GameController gameConraller;
  StagesModule stagesManager = StagesModule();

  late SharedPreferences sharedPreferences;
  bool isNoAction = true ;
  int helpAddTryis = 20;
  int helpAddCurrectCard = 20;
  // int _cardnum = 2;
  int gamelevle = 31;
  // int _lastno = 0;
  // int _lastitemno = 10;
  List<String> valuesCards = [];
  List<CardModule> cards = [];
  List<String> imagschosing = [];
  // int _imagelevelRandm = 0;
  // int _imageArray = 0 ;
  int defcultLevel = 0 ;
  // int colomesno = 2;
  int _counter = 0;
  CardModule? card1, card2; // tra
  ONClickCard onClickCard = ONClickCard();
  int _defultlevel = 1;
  int _defulthelpersAdd = 20;
  int _defulthelpersCurrect = 10;
PlaySound play = PlaySound();
 late  StageConfigs stageConfigs  ;

  void gameInit() async {

    await stagesManager.laodnig();

    await _loadSavedData();
      stageConfigs = StageConfigs(gamelevle);
    // _cardnum = _getDatafromjson(stagesManager.cardnum);
    // _imagelevelRandm = _getDatafromjson(stagesManager.imagelevel);
    // _imageArray = _getDatafromjson(stagesManager.imageArray);
    // _lastitemno = _getDatafromjson(stagesManager.lastitemno);
    // colomesno = _getDatafromjson(stagesManager.colomesno);

    gameConraller = GameController(
      defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
        helpAddTryis: helpAddTryis ,
        helpAddCurrectCard: helpAddCurrectCard );

    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    play.playStart();
    isNoAction  = false ;
    emit(GameLoading());
  }
void _gamelaoding (){

}
  void gameRestart() async {
    await _loadSavedData();


    // _cardnum = _getDatafromjson(stagesManager.cardnum);
    // _imagelevelRandm = _getDatafromjson(stagesManager.imagelevel);
    // _imageArray = _getDatafromjson(stagesManager.imageArray);
    // _lastitemno = _getDatafromjson(stagesManager.lastitemno);

    // colomesno = _getDatafromjson(stagesManager.colomesno);

    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
        helpAddTryis: helpAddTryis ,
        helpAddCurrectCard: helpAddCurrectCard );

    // imagesvalues.clear() ;
    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    isNoAction  = false ;
    emit(GameLoading());
    Timer(Duration(milliseconds: 100), () {
      _counter = 0;
play.playStart();
      emit(GameStart());
    });
  }
  void gameNextLevel() async {
    await _loadSavedData();
    stageConfigs = StageConfigs(gamelevle);


    // _cardnum = _getDatafromjson(stagesManager.cardnum);
    // _imagelevelRandm = _getDatafromjson(stagesManager.imagelevel);
    // _imageArray = _getDatafromjson(stagesManager.imageArray);
    // _lastitemno = _getDatafromjson(stagesManager.lastitemno);

    // colomesno = _getDatafromjson(stagesManager.colomesno);

    gameConraller = GameController(
        defcualt: stageConfigs.defcult,
        gamelevle: gamelevle,
        cardnum: stageConfigs.cardnum,
        imagelevelRandom: stageConfigs.imagelevelRandom,
        lastitemno: stageConfigs.lastno,
        colomesno: stageConfigs.colomesno,
        scors: 0,
        trayes: _settryies(stageConfigs.cardnum),
        helpAddTryis: helpAddTryis ,
        helpAddCurrectCard: helpAddCurrectCard );

    // imagesvalues.clear() ;
    imagesvalues = stageConfigs.imagValue;
    _randomchosing();
    isNoAction  = false ;
    emit(GameLoading());
    Timer(Duration(milliseconds: 100), () {
      _counter = 0;
      play.playStart();
      emit(GameStart());
    });
  }

  void clik(CardModule card, int i) async {
    // gameConraller.trayes--;
 isNoAction  = true ;
    emit(CardRotat());
    cards[i].isclicked = true;
    cards[i].result = IS_CHOSSED;
    _counter++;
    await  play.playClick();
    Timer(Duration(milliseconds: 500), () async {
      if (_counter == 2) {
        card2 = cards[i];
        emit(WaitToResult());

        Timer(Duration(milliseconds: 500), () async {
          if (_matching(card1!.imagesv, card2!.imagesv)) {
            _currect();
            _counter = 0;
             gameConraller.scors = gameConraller.scors + 2 ;
            await play.playCurrect() ;
            emit(ResultCurrect());
          } else {
          await   play.playWrong();
            _warng();
            _counter = 0;
          gameConraller.trayes = gameConraller.trayes - 2 ;
            emit(ResultWrong());
          }
        });
      } else {
        card1 = cards[i];
isNoAction = false  ;
        emit(ClickedCard1());
      }
    });
  }

  void helpAdd() {
    gameConraller.trayes = gameConraller.trayes + 10;
    helpAddTryis = helpAddTryis - 1;
    sharedPreferences.setInt(sharedhelpadd, helpAddTryis);
    if (helpAddTryis == 0) {
      return;
    }
    play.playhelpAdd();
    emit(HelpAdd());
  }

  void resultDone(CardModule c) {
    if (cards[c.cardno].result == MATCHED) {
      isNoAction  = false ;
      emit(ResultDone());
      return;
    }
    cards[c.cardno].result = NO_CHANCH;
    isNoAction = false ;
    emit(ResultDone());
  }

  dynamic _getDatafromjson(Cell c) {
    return stagesManager.dataTable[gamelevle - 1].getvalue(c);
  }

  bool _matching(String c, String c1) {
    return c == c1;
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

  Future _loadSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    gamelevle = sharedPreferences.getInt(sharedStages) ?? _defultlevel;
    helpAddTryis = sharedPreferences.getInt(sharedhelpadd) ?? _defulthelpersAdd;
    helpAddCurrectCard =
        sharedPreferences.getInt(sharedhelpcurrect) ?? _defulthelpersCurrect;
  }

  int _settryies(int cardno ) {

      return  cardno * 2- defcultLevel *2 ;

  }


  void _randomchosing() {
    int _lastno = gameConraller.lastitemno ;
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
    print ("card ${gameConraller.cardnum} colums ${gameConraller.colomesno}");
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
            return 1.2;
          case 28:
            return 1.75;
        }
    }
    return 1.30;
  }

  double fontsize() {
    switch (gameConraller.colomesno) {
      case 2:
        return 45.sp;
      case 3:
        return 40.sp;
      case 4:
        return 25.sp;
    }
    return 10;
  }

  void helpcurect( ) {
    gameConraller.helpAddCurrectCard--;
    sharedPreferences.setInt(
        sharedhelpcurrect, gameConraller.helpAddCurrectCard);
    if (gameConraller.helpAddCurrectCard == 0) {
      return;
    }
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

        gameConraller.scors = gameConraller.scors + 2 ;
        emit(ResultCurrect());
      });
    }
  }


void switchGameOver(){
    bool isw = gameConraller.isGameWin();
 if (  isw    ){

   emit(Winner());}
 if (   gameConraller.isGameLoss()){

   emit(Losser());}

}

}
