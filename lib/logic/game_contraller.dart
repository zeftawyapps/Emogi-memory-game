import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/logic/mylibs/stagesmodule.dart';

class GameConraller{



  int gamelevle = 15 ;
  int cardnum =12;
  int imagelevel = 3;
  int lastitemno = 10;
  int colomesno =3;
  int scors = 0;
  int trayes = 48;
  int helpAddTryis= 20;
  int helpAddCurrectCard= 10;

  GameConraller(
      { required  this.gamelevle,
    required   this.cardnum,
    required   this.imagelevel,
    required   this.lastitemno,
    required   this.colomesno,
    required   this.scors,
   required    this.trayes,
   required    this.helpAddTryis,
   required    this.helpAddCurrectCard,
     });
}