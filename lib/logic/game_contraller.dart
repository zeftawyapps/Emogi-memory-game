
class GameController{



  int gamelevle = 20 ;
  int cardnum =12;
  int imagelevelRandom = 50;
  int lastitemno = 10;
  int colomesno =3;
  int scors = 0;
  int trayes = 48;
  // int helpAddTryis= 20;
  // int helpAddCurrectCard= 10;
int defcualt = 0 ;
  GameController(
      { required  this.gamelevle,
    required   this.cardnum,
    required   this.imagelevelRandom,
    required   this.lastitemno,
    required   this.colomesno,
    required   this.scors,
   required    this.trayes,

        required this.defcualt
     });

  bool isGameWin(){
    return scors == cardnum ;
  }
  bool isGameLoss(){
    return trayes == 0 ;
  }
}