import 'package:flutter/material.dart';
import 'package:memory_game/logic/projprovider.dart';
import 'package:memory_game/ui/pages/gamescreen.dart';
import 'package:memory_game/logic/gameprovider.dart';
import 'package:memory_game/ui/pages/spachscreen.dart';
import 'package:memory_game/ui/pages/test.dart';
import 'package:provider/provider.dart';

import 'ui/pages/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider (create:(context)=> GameProvider())
      ,ChangeNotifierProvider (create:(context)=> ProjectProvider())

      ]

      ,child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home : SpachScreen()),);
  }
}


