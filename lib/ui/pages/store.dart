import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/store_cubit/store_cubit.dart';
import 'package:memory_game/ui/widgets/help_tools_store.dart';
import 'package:memory_game/ui/widgets/mony_counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/game_provider.dart';
import '../../logic/values.dart';
import '../values.dart';

class GameStoresDialog extends StatefulWidget {
  Color background ;
  GameStoresDialog({Key? key , required this.background }) : super(key: key);

  @override
  State<GameStoresDialog> createState() => _GameStoresDialogState();
}

class _GameStoresDialogState extends State<GameStoresDialog> {
  late StoreCubit storeCubit;
  int? money;
 late  GameProvider gameProvider ;

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
    money = gameProvider.money ;
    return ZoomIn(
      child: Dialog(
        child: Container(
            width: 500 ,
            height: 1000 ,
            decoration: BoxDecoration(
                color: widget.background ,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      color: widget.background,
                      child: Text('Store',
                          style: Theme.of(context).primaryTextTheme.headline2)),
                  SizedBox(
                    height: 20 ,
                  ),
                  MonyCounter(
                    money: money ?? 0,
                  ),
                  Expanded(flex: 15, child: HelpToolsStore(money: money ?? 0)),
                  SizedBox(
                    height: 10 ,
                  ),
                  Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: () {Navigator.pop(context);  },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: bcbegcard,
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Close",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.white),
                            )),
                          ),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  Future laodMoneyValue() async {
    if (money == null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        money = sharedPreferences.getInt(sharedMoney) ?? 0;
      });
    }
  }
}
