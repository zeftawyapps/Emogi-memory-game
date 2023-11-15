import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:memory_game/logic/game_value.dart';

class StageConfigs {
GameValues? gameValues ;



  List<List<String>> imaglevels = [];

  List<String> imagValue = [];

  int cardNumberRond = 2;
  int cardValueRond = 2;

  int cardnum = 2;
  int gamelevle = 60;
  int lastno = 0;
  int defcult = 0;
  int imagelevelRandom = 0;
  int imageArray = 0;
  int colomesno = 0;


  StageConfigs(int gamelevle) {
    gameValues = new GameValues();
    int cardNo;
    int culomno;
    int lastNo;
    this.gamelevle = gamelevle;
    List<String> imaglist;
    int stage = _setStagesConstrain();

    switch (stage) {
      case 0: //3
        _setProparties(
            cardNo: 6,
            colomNo: _getCulomNo(6),
            lastNo: _getLasNo(gameValues!.  imagesvaluesFirstStages.length),
            imagValue: gameValues !.  imagesvaluesFirstStages,
            defculat: 0);
        break;
      case 1: //up 3
        cardNo = _getCardNo([ 8, 12]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(1);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 0);
        break;
      case 2: // up 20
        cardNo = _getCardNo([8, 12, 20]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(3);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 0);
        break;
      case 3: // up 50
        cardNo = _getCardNo([ 12, 20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 1);
        break;
      case 4:
        cardNo = _getCardNo([ 20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 3);
        break;
      case 5:
        cardNo = _getCardNo([  20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 4);
        break;

      case 6:
        cardNo = _getCardNo([  24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 5);
        break;
    }
  }

  void _setProparties(
      {required int cardNo,
      required int colomNo,
      required int lastNo,
      required int defculat,
      required List<String> imagValue}) {
    this.cardnum = cardNo;
    this.colomesno = colomNo;
    this.lastno = lastNo;

    this.imagValue = imagValue;
  }

  int _setStagesConstrain() {
    if (gamelevle <= 3) {
      return 0;
    } else if (gamelevle <= 20 && gamelevle > 3) {
      return 1;
    } else if (gamelevle <= 50 && gamelevle > 20) {
      return 2;
    } else if (gamelevle <= 100 && gamelevle > 50) {
      return 3;
    } else if (gamelevle <= 200 && gamelevle > 100) {
      return 4;
    } else if (gamelevle <= 300 && gamelevle > 200) {
      return 5;
    } else {
      return 6;
    }
  }

  int _getCulomNo(int cardNo) {
    if (cardNo == 6 || cardNo == 8) {
      return 2;
    } else if (cardNo == 12) {
      return 3;
    } else {
      return 4;
    }
  }

  int _getCardNo(List<int> cardsNoList) {
    Random rands = new Random();
    int randomNumber = rands.nextInt(cardsNoList.length);

    return cardsNoList[randomNumber];
  }

  int _getLasNo(int length) {
    Random rands = new Random();
    int randomNumber = rands.nextInt(length);

    return randomNumber;
  }

  List<String> _getimagLevel(int i) {
    imaglevels = [
     gameValues!.  imagesvaluesFirstStages,
      gameValues!.  imagesvaluesFlages,
      gameValues!. imagevalueFaces,
      gameValues!.imageValueAnimals ,
      gameValues!.imagesvaluesFirstStagesDouble ,
      gameValues!. imagevaluePlantsAndFoods,  gameValues!. imagevalueTransfares ,   gameValues!.imagevaluesigals
    ];
    if (i == 1) {
      return imaglevels[0];
    } else {
      int s;
      if (i == 2) {
        s = 3;
      } else if (i == 3) {
        s = 5;
      } else {
        s = imaglevels.length;
      }
      Random r = Random();
      int ir = r.nextInt(s);
      print("ir $ir");
      return imaglevels[ir];
    }
  }


}
