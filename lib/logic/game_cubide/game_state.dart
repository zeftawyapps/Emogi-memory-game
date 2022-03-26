part of 'game_cubit.dart';

@immutable
  class GameStatus {

    GameStatus() {
   }

}
abstract class GameResults {}
class GameLoading  implements GameStatus {

}
class GameStart  implements GameStatus {

}
class NewGame  extends GameStart  implements GameStatus {

}
class HelpCorroct extends GameStart implements GameStatus {

}

class HelpAdd extends GameStart   implements GameStatus {

}
class  CardRotat extends GameStart implements   GameStatus {

}
class  ClickedCard1 extends GameStart implements   GameStatus  {

}


class  WaitToResult extends GameStart implements   GameStatus {
}
class  ResultCurrect extends GameStart implements   GameStatus
,GameResults
{

}
class  ResultWrong extends GameStart implements   GameStatus ,  GameResults{

}
class  ResultDone extends GameStart implements   GameStatus  {

}

