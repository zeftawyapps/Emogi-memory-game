import 'package:flutter/material.dart';

import 'gamescreen.dart';
import 'test.dart';

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

      Game_Sreen ( )  ,
    );
  }
}
