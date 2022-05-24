import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_game/logic/game_provider.dart';
import 'package:memory_game/ui/pages/spachscreen.dart';
import 'package:provider/provider.dart';

 import 'logic/projprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<GameProvider>(create: (c) => GameProvider()),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false ,
              theme: new ThemeData(scaffoldBackgroundColor: Colors.black ),

            home : SpachScreen()),
        );
      }
    );
  }
}


