

import 'dart:core';

import 'dart:core';
List<List<String>> imaglevels =[];
List<String>imagesvalues=[];

List<String>imagesvalues_FirstStages =  [

 '😀','😵' , '👳' ,
'😂','🥰','😘','😐','😶',"🌫️",'😏'
'😯','😲','🥱','😫',
'👺','💘', '💚', '💙', '💛', '🧡','🇪🇬', '❤', '🙊','🙉','💝','💖','😺',
'😸','😹','😻','😼','😈','👿','🤬','😠','👽','😓','😞','😂','🙃','😇','😍','🤩'
 '🐏' , '🐑', '🐐' , '🐪' , '🐫','🦙','🦒','🐻','🐻'  , '❄',
 '🐻','🦇','🦔','🐿️','🐓','🐣','🐤','🐥','🐦','🐧','🦅','🦆','🦢','🦉','🐬','🐋','🐳','🦖','🌿'
     '☘','🍀','🍁','🍂','🍃',
 '🌲','🌳','🌴','🌵','🌾','🦠','🐙','🐸','🦜','🦚','🦡','🐀','🐷','🐖'
, '🐗','🐽','🐄','🐃','🐂','🐮',
 '🇪🇬' , '🇦🇺' ,'🇧🇳' ,'🇨🇮' ,'🇲🇩' ,'🇲🇽' ,'🇲🇾', '🇵🇬' ,'🇵🇭',
 '🇵🇰','🇵🇱' ,'🇵🇲' ,'🇵🇷' ,'🇵🇳' ,'🇸🇬' ,'🇸🇪' ,'🇸🇩' ,'🇸🇨' ,'🇸🇧' ,'🇸🇦','🇷🇼'
     '🇷🇺', '🇷🇸' ,'🇮🇳', '🇬🇷', '🇬🇸', '🇫🇲' ,'🇫🇴' ,'🇵🇱' ,'🇳🇫', '🇳🇬' ,'🇳🇮' ,'🇳🇱', '🇳🇴' ,'🇲🇶', '🇳🇵' ,'🇳🇷'


     '🐻🦇','🦔🐿️','🐓🐣','🐤🐥','🐦🐧','🦅🦆','🦢🦉','🐬🐋','🐳🦖','🌿☘','🍀🍁','🍂🍃',
 '🌲🌳','🌴🌵','🌾🦠','🐙🐸','🦜🦚','🦡🐀','🐷🐖'

];



List<String> getimagLevel(int i ){
 imaglevels  =[imagesvalues_FirstStages];
 return imaglevels[i];
}
 class CardModule{int state =0;  String imagesv='';
 bool isrotating  = false ;
 bool isclicked  = false ;
 int cardno;int result = NO_CHANCH;
 CardModule( this.imagesv,this.cardno);
 }
 const int  IS_CHOSSED = 1;
const int  NO_CHANCH = 0;
const int  MATCHED = 2;