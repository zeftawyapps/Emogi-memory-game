import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/logic/gameprovider.dart';
import 'package:memory_game/ui/pages/gamescreen.dart';
import 'package:provider/provider.dart';
class SpachScreen extends StatelessWidget {
    SpachScreen({Key? key}) : super(key: key);
GameProvider gameProvider = GameProvider() ;
  @override
  Widget build(BuildContext context) {

    gameProvider = context.watch<GameProvider>();

  Timer.periodic(Duration(seconds: 1 ), (timer) {
    gameProvider.loading() ;
    Navigator.pushReplacement(context , MaterialPageRoute(builder:   (c)=>Game_Sreen())); 
    timer.cancel() ; });
    return Scaffold(body: Container(child: Center(child: Text("s"),),));
  }
}
