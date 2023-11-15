import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/store_cubit/store_cubit.dart';
import 'package:memory_game/ui/widgets/help_tools_store.dart';
import 'package:memory_game/ui/widgets/mony_counter.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/game_provider.dart';
import '../../logic/values.dart';
import '../values.dart';

class GameSettingsDialog extends StatefulWidget {
  Color background ;
  GameSettingsDialog({Key? key , required this.background }) : super(key: key);

  @override
  State<GameSettingsDialog> createState() => _GameSettingsDialogState();
}

class _GameSettingsDialogState extends State<GameSettingsDialog> {
  late StoreCubit storeCubit;
  int chosed = 0 ;
 late  GameProvider gameProvider ;
RateMyApp? rateMyApp ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeCubit = StoreCubit();
    storeCubit.laodMoneyValue();
  }

  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider >()  ;
    gameProvider.laodMoneyValue() ;

    return RateMyAppBuilder(
      rateMyApp:  RateMyApp(
        googlePlayIdentifier: "com.zeftawyapps.gams.memory.memory_game"
      ) ,
      builder: (context) {
        return ZoomIn(
          child: Dialog(

            child: Container(
                width: 500 ,
                height: 300 ,
                decoration: BoxDecoration(
                    color: widget.background ,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)),
                child:Column(children: [
                  Container(
                      child: Center(
                        child: Text('Main menue',
                            style:TextStyle(color: Colors.white , fontSize: 25) ),
                      )),

                  button(titel: "Resume", onpress: (){
                    setState(() {
                      chosed = 0 ;
                      Navigator.of(context ).pop(chosed);
                    });
                  } ) ,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 2),
                    child: button(titel: "Restart",
                        onpress: (){
                          Navigator.of(context ).pop(1);
                        }
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 2),
                    child: button(titel: "Rate",
                        onpress: (){
rateMyApp!.launchStore();
                        }
                    ),
                  ) ,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 2),
                    child: button(titel: "Exit",
                        onpress: (){
                          SystemNavigator.pop();
                        }
                    ),
                  ) ,



                ],)),
          ),
        );
      }, onInitialized: (BuildContext context, RateMyApp rateMyApp) { this.rateMyApp = rateMyApp ;  },
    );
  }

   Widget button({ required  String titel  , required var onpress }){

   return  MaterialButton(
      onPressed: onpress
       ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: bcbegcard,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
                "$titel",
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              )),
        ),
      ),
    ) ;
  }
}
