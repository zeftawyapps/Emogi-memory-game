

import 'dart:core';

import 'dart:core';

 List<List<String>> imaglevels =[];
 List<String>imagesvalues=[];


 // List<String> getimagLevel(int i ){
 //  imaglevels  =[imagesvaluesFirstStages , imagesvaluesFlages , imagevalueFaces];
 //  return imaglevels[i];
 // }

 const   int  IS_CHOSSED = 1;
 const  int  WRONG_CHOOSe = 3;

 const  int  NO_CHANCH = 0;
  const  int  MATCHED = 2;
 const   int  STARTED = -1;


 List<int> cardNomper=[6 , 8 , 12 , 20 , 24];



class CardModule{int state =0;  String imagesv='';
bool isrotating  = false ;
bool isclicked  = false ;
int cardno;int result = STARTED;
CardModule( this.imagesv,this.cardno);
}