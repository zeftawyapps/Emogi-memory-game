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
import 'package:memory_game/logic/values.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameStatus> {
  GameCubit() : super(GameStatus());
  late GameConraller gameConraller;
  StagesModule stagesManager = StagesModule();

  late SharedPreferences sharedPreferences;
  int? helpAddTryis  = 20  ;  int?  helpAddCurrectCard = 20 ;
  int _cardnum = 2;
  int gamelevle = 1;
  int _lastno = 0;
  int _lastitemno = 10;
  List<String> valuesCards = [];
  List<CardModule> cards = [];
  List<String> imagschosing = [];
  int _imagelevel = 0;
  int colomesno = 2;
  int _counter = 0;
  CardModule? card1, card2;// tra
ONClickCard onClickCard  = ONClickCard();
  int _defultlevel = 1;
  int _defulthelpers = 20;
  void gameInit() async {
    await stagesManager.laodnig();

    await _loadSavedData();

    _cardnum = _getDatafromjson(stagesManager.cardnum);
    _imagelevel = _getDatafromjson(stagesManager.imagelevel);

    _lastitemno = _getDatafromjson(stagesManager.lastitemno);

    colomesno = _getDatafromjson(stagesManager.colomesno);

    gameConraller = GameConraller(
        gamelevle: gamelevle,
        cardnum: _cardnum,
        imagelevel: _imagelevel,
        lastitemno: _lastitemno,
        colomesno: colomesno,
        scors: 0,
        trayes: _settryies(),
        helpAddTryis: helpAddTryis ?? 20,
        helpAddCurrectCard: helpAddCurrectCard ?? 20);

    imagesvalues = _getimagLevel(0);
    _randomchosing();
    emit(GameLoading());
  }

  void gameRestart() async {
    await _loadSavedData();

    _cardnum = _getDatafromjson(stagesManager.cardnum);
    _imagelevel = _getDatafromjson(stagesManager.imagelevel);

    _lastitemno = _getDatafromjson(stagesManager.lastitemno);

    colomesno = _getDatafromjson(stagesManager.colomesno);

    gameConraller = GameConraller(
        gamelevle: gamelevle,
        cardnum: _cardnum,
        imagelevel: _imagelevel,
        lastitemno: _lastitemno,
        colomesno: colomesno,
        scors: 0,
        trayes: _settryies(),
        helpAddTryis: helpAddTryis ?? _defulthelpers,
        helpAddCurrectCard: helpAddCurrectCard ?? _defulthelpers);
    // imagesvalues.clear() ;
    imagesvalues = _getimagLevel(0);
    _randomchosing();

    emit(GameLoading());
    Timer(Duration(milliseconds: 100), () {
      _counter = 0;

      emit(GameStart());
    });
  }

  void clik(CardModule card, int i) {
    gameConraller.trayes -- ;

    emit(CardRotat());
    cards[i].isclicked = true;
    cards[i].result = IS_CHOSSED;
    _counter++;
    Timer(Duration(milliseconds: 500), () {
      if (_counter == 2) {
        card2 = cards[i];
        emit(WaitToResult());

        Timer(Duration(milliseconds: 500), () {
          if (_matching(card1!.imagesv, card2!.imagesv)) {
            _currect();
            _counter = 0;
            gameConraller.scors ++ ;
            emit(ResultCurrect());
          } else {
            _warng();
            _counter = 0;
             emit(ResultWrong());
          }
        });
      } else {
        card1 = cards[i];
        emit(CardClick());
      }
    });



  }

  void resultDone(CardModule c) {
    if (cards[c.cardno].result == MATCHED) {
      emit(ResultDone());
      return;
    }
    cards[c.cardno].result = NO_CHANCH;
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
    helpAddTryis = sharedPreferences.getInt(sharedhelpadd) ?? _defulthelpers;
    helpAddCurrectCard =
        sharedPreferences.getInt(sharedhelpcurrect) ?? _defulthelpers;
  }

  int _settryies() {
    if (gamelevle < 50) {
      return _cardnum * 3;
    }
    if (gamelevle > 50 && gamelevle < 70) {
      return _cardnum * 3 - 5;
    }

    return _cardnum * 3;
  }

  List<String> _getimagLevel(int i) {
    imaglevels = [imagesvalues_FirstStages];
    return imaglevels[i];
  }

  void _randomchosing() {
    _lastno = _lastitemno;
    Random randomimage = new Random();
    Random randomplace = new Random();
    print(imagesvalues.length.toString());
    cards.clear();
    imagschosing.clear();

    double imgerequscount = _cardnum / 2;
    int randomNumber = randomimage.nextInt(_imagelevel);
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
    for (int i = 0; i < _cardnum; i++) {
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
  }

  double aspectretio() {
    switch (colomesno) {
      case 2:
        if (_cardnum == 6) {
          return 1.3;
        } else {
          return 1.75;
        }
      case 3:
        return 1.2;
      case 4:
        switch (_cardnum) {
          case 20:
            return 1.1;
          case 24:
            return 1.3;
          case 28:
            return 1.5;
        }
    }
    return 1.30;
  }

  double fontsize() {
    switch (colomesno) {
      case 2:
        return 45.sp;
      case 3:
        return 40.sp;
      case 4:
        return 30.sp;
    }
    return 10;
  }




}
