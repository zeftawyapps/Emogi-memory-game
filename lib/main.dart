import 'package:flutter/material.dart';
import 'package:memory_game/ui/pages/old/spachscreen.dart';
import 'package:provider/provider.dart';

import 'logic/gameprovider.dart';
import 'logic/projprovider.dart';

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


