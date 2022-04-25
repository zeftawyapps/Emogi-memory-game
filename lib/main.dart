import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/ui/pages/spachscreen.dart';
import 'package:provider/provider.dart';

 import 'logic/projprovider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false ,
            theme: new ThemeData(scaffoldBackgroundColor: Colors.black ),

          home : SpachScreen());
      }
    );
  }
}


