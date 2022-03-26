import 'package:flutter/material.dart';
import 'package:memory_game/ui/pages/game_screen.dart';

 import 'old/test.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:

      GameScreen ( )  ,
    );
  }
}
