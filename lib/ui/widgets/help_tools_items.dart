import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/game_provider.dart';
import 'package:memory_game/ui/pages/store.dart';
import 'package:memory_game/ui/widgets/alarm_containt/pay_from_store.dart';
import 'package:memory_game/ui/widgets/pay_alarm_dailog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/values.dart';
import '../values.dart';
import 'gameicons_icons.dart';

class HelpToolsItem extends StatelessWidget {
  HelpToolsItem(
      {Key? key,
      required this.type,
      required this.price,
      required this.count,
      required this.money,
      required this.gameCubit})
      : super(key: key);

  String type;
  int price;
  int count;
  int money;
  late bool isEnabled;
  late GameProvider gameProvider;
  GameCubit gameCubit;
  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();

    isEnabled = money >= price;

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 30.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: bcbegGamebtn,
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  type == sharedhelpadd ? Icons.add : Gameicons.ok,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "   $count",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 30,
              height: 30,
              child: Image.asset(imageCoins),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                " $price",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: MaterialButton(
              onPressed: () {
                gameCubit.loadSavedDataWithoutinit();

                if (isEnabled) {
                  showMassagePay(context ) ;
                } else {}
              },
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                    color: bcbegcard,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "puy",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: isEnabled ? Colors.white : Colors.red[700]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void payTheProduct() {
    if (type == sharedhelpadd) {
      gameCubit.helpAddPaid(count);
    } else {
      // v = v + count ;
      gameCubit.helpcurectPay(count);
    }
gameProvider.declineMoney(price);
  }

  void showMassagePay(BuildContext context) {
    showDialog(
        context: context,
        builder: (c) {
          return AlarmDialog(containt: ContentPayFromStoreDialog(count: count , type: type  ,
          ) , title:   "pay",) ;
        }).then((value){
          payTheProduct() ;
    });
  }
}
