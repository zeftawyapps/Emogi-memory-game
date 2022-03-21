part of 'game_cubit.dart';

@immutable
  class GameStatus {

    GameStatus() {
   }

}

class GameLoading  implements GameStatus {

}
class GameStart  implements GameStatus {

}
class NewGame  extends GameStart  implements GameStatus {

}
class HelpCorroct extends GameStart implements GameStatus {

}

mixin HelpAdd implements GameStatus {

}
class  CardRotat extends GameStart implements   GameStatus {

}
class  CardClick extends GameStart implements   GameStatus  {

}
class  WaitToResult extends GameStart implements   GameStatus {
}
class  Result extends GameStart implements   GameStatus {

}
class  ResultDone extends GameStart implements   GameStatus  {

}
mixin CardCurrect implements GameStatus {

}
mixin CardWrang implements GameStatus {

}
