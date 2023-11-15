import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:memory_game/logic/game_value.dart';

class GameTheameConfig{
GameValues gameValues = GameValues() ;
LinearGradient? background ;
Color? cardOfColor ;
Color? cardOnColor ;
Color? dailogcolor;
Color? helpcardsColor;
Color? LawAttempetCardsColor;
  void  getBackgrund(){
    Random rands = new Random();
    int randomNumber = rands.nextInt(5);


    background = gameValues.  lineargradien[randomNumber];
    cardOfColor =  gameValues .  cardOfColors[randomNumber];
    cardOnColor =  gameValues.  cardOnColors[randomNumber];
    dailogcolor =  gameValues  .  deilogColors[randomNumber];
    helpcardsColor =  gameValues.  helpColors[randomNumber] ;
  }
}