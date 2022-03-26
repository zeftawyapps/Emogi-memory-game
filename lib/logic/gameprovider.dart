import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/mylibs/modulscreateor.dart';
import 'package:memory_game/logic/mylibs/stagesmodule.dart';
 import 'package:memory_game/logic/values.dart';
 import 'package:shared_preferences/shared_preferences.dart';

 import 'imgvalues.dart';

class GameProvider extends ChangeNotifier {
  List<String> valuesCards = [];
  List< CardModule > cards =  [];
bool isgamestarted = false ;
bool iscrrect = false ;
  // main values to start any level

 /// nomber of cards for any level
  int gamelevle = 15 ;
  int cardnum =12;
  int imagelevel = 3;
  int lastitemno = 10;
  int colomesno =3;
bool iswin = false ;
bool isloss = false ;
int myscors = 0;
  int trayes = 48;
  int haddtryis= 20;
  int hacurrectcard= 10;
 int scores = 0 ;
  bool haddfinneshed = false ;
  bool hcurrectfinneshed = false ;

  ///click values
  String c1 =''; String  c2='d' ;
  int counter = 0  ;
  List <String> imagschosing = [];
  StagesModule stagesManager = StagesModule();
 late  SharedPreferences sharedPreferences ;
void loading (){
  stagesManager.laodnig() ;
  notifyListeners() ;
}
 ///game procsseing method
  void  game()async  {

sharedPreferences = await SharedPreferences.getInstance();
if (sharedPreferences.getInt(sharedStages)!=null ) {
    gamelevle  =    sharedPreferences.getInt(sharedStages)!;
}else{
  gamelevle = 1; }

if (sharedPreferences.getInt(sharedhelpadd)!=null ) {
  haddtryis  =    sharedPreferences.getInt(sharedhelpadd)!;
}else{
  haddtryis = 20; }

if (sharedPreferences.getInt(sharedhelpcurrect)!=null ) {
  hacurrectcard  =    sharedPreferences.getInt(sharedhelpcurrect)!;
}else{
  hacurrectcard = 10; }

loadGamelevel();

  }

  dynamic getDatafromjson (  Cell c ){
    return stagesManager .dataTable[gamelevle-1].getvalue(c);
  }
  int settryies(){
  if (gamelevle < 50){return cardnum*3 ; }
  if (gamelevle > 50 && gamelevle < 70  ){return cardnum*3 - 5 ; }

  return cardnum * 3  ;
  }
  void loadGamelevel( ){

      cardnum =getDatafromjson(  stagesManager.cardnum);
      imagelevel = getDatafromjson( stagesManager.imagelevel);;
      lastitemno = getDatafromjson( stagesManager.lastitemno);;
      colomesno =getDatafromjson( stagesManager.colomesno);;
myscors = 0 ;
trayes  = settryies() ;
iswin =false ;
    // String d = getDatafromjson(stagesManager.images).toString();
      imagesvalues = getimagLevel(0);
      _randomchosing();
    notifyListeners() ;
  }


  bool losseing  (){
    isloss = trayes <= 0;
    notifyListeners();
    return   isloss ;
  }

  bool winning (){
    iswin = myscors == cardnum;
    if (iswin){
      calulateScroe();
    }
    notifyListeners();
return   iswin;
  }
void setwining (){iswin = false ; notifyListeners() ;}
  void calulateScroe(){

    scores =  trayes*70 ;
 print (scores);
  }
  void scoresadd1(){
    myscors =myscors+2;
    notifyListeners();
  }
  void tryesloss1(){
    trayes --  ;
    notifyListeners();
  }
int _lastno = 0  ;
 late  Timer  _timer;
  void _randomchosing() {
    _lastno = lastitemno ;
    Random randomimage = new Random();
    Random randomplace = new Random();
    print(imagesvalues.length.toString());
cards.clear() ;
    imagschosing.clear() ;

    double imgerequscount = cardnum / 2;
    int randomNumber = randomimage.nextInt(imagelevel);
// to generate the image thet by used in game
    for (int i = 0; i < imgerequscount; i++) {
      _lastno = _lastno + randomNumber+1;
      if (_lastno > imagesvalues.length-1){_lastno = 0 ; }
      imagschosing.add(imagesvalues[_lastno]);
    }


    List<Map<int,String>> cardprocess2 =   <Map<int,String>>[];
    List<String> cardprocess =   <  String> [];
    int i2 = 0 ; int ivalue = 0;
    for (int i = 0; i < cardnum; i++) {

      cardprocess.add(  imagschosing[ivalue]  );
      cardprocess2.add({i : imagschosing[ivalue]} );
      if (i%2 != 0){ivalue ++ ; }
      print(cardprocess[i]);
    }
    print(cardprocess);
    int cardsl = cardprocess.length;
   for(int i =0; i < imagschosing.length;i++){

     int  r1  = randomplace.nextInt(cardprocess.length);

     cards.add(CardModule(cardprocess[r1],r1 ));
     cardprocess.remove(cardprocess[r1 ]);

     int  r2  = randomplace.nextInt(cardprocess.length);
     cards.add(CardModule( cardprocess[r2],r2));
     cardprocess.remove(cardprocess[r2 ]);

   }
for (int i =0 ; i<cards.length ; i++){
  cards[i].cardno = i ;
  print('${cards[i].imagesv}  noms  ${cards[i].cardno}' );
}
    isgamestarted = true ;
notifyListeners();
     }
int clicki1 = 0;
  int clicki2 = 0;
  void onClick (String v,int i){

cards[i].state = 1 ;
    if (counter ==0 ){c1 = v ; counter ++; clicki1 = i ; }else
    if (counter ==1 ){c2 = v ; counter =0 ; clicki2 = i ;

    iscrrect = matching(c1, c2);
    if (iscrrect){

      iscrrect =false ;
    }else {


    }
    print(iscrrect) ;
    }
    print(v);
    notifyListeners();
     }
     bool matching (String c , String c1 ){
  return   c == c1 ;

     }

     void helpAdd(){
    trayes=trayes+10 ;
    haddtryis --;
     sharedPreferences.setInt(sharedhelpadd , haddtryis);
    if (haddtryis == 0){haddfinneshed = true; }else {haddfinneshed = false;}

    notifyListeners();
     }
  List< CardModule > cardscurrect =  [];

 restartgame(){
    for(int i =0 ; i<cards.length;i++  ){
     cards[i].state = 0;

    }
trayes = settryies() ;
    myscors = 0 ;
  notifyListeners() ;
  }
}
