part of 'game_cubit.dart';

@immutable
  class GameState {
  GameState._internal();
  static final GameState _gameState = GameState._internal();
  factory GameState() {
    return _gameState;
  }

}

mixin GameLoading implements GameState {

}
mixin NewGame implements GameState {

}
mixin HelpCorroct implements GameState {

}

mixin HelpAdd implements GameState {

}

mixin CardClick implements GameState {

}
mixin CardCurrect implements GameState {

}
mixin CardWrang implements GameState {

}
