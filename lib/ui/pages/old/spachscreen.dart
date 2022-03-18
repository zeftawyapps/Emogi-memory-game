import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/gameprovider.dart';
import 'gamescreen.dart';
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
