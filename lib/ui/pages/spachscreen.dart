import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/ui/pages/game_screen.dart';
import 'package:provider/provider.dart';

import '../../logic/gameprovider.dart';
import '../values.dart';

class SpachScreen extends StatefulWidget {
  SpachScreen({Key? key}) : super(key: key);

  @override
  State<SpachScreen> createState() => _SpachScreenState();
}

class _SpachScreenState extends State<SpachScreen> {
  GameProvider gameProvider = GameProvider();

  bool isDesapear = false;

  bool loadGame = false ;

  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();

    Timer.periodic(Duration(seconds: 2), (timer) {
      gameProvider.loading();
      if (isDesapear) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => GameScreen()));

          timer.cancel();

      } else {
        isDesapear = true;
      }
    });
    return   Scaffold(
      backgroundColor: Colors.black ,
        body:  Container(
      color: Colors.black,
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 700),
          opacity:isDesapear? 0:  1 ,
          child: FadeIn(
            child: Center(
              child: Image.asset(imageLogo),
            ),
          )),
    ));
  }
}
