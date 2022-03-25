import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/imgvalues.dart';

class ONClickCard  {
  CardModule? card1, card2;
  int counter = 0  ;
void CardClick(){

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
  bool _matching(String c, String c1) {
    return c == c1;
  }
}