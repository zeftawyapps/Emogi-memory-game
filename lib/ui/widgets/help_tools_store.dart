
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/values.dart';
import 'package:memory_game/ui/widgets/help_tools_items.dart';
class HelpToolsStore extends StatefulWidget {
    HelpToolsStore({Key? key , required this .money }) : super(key: key);
int money ;
  @override
  State<HelpToolsStore> createState() => _HelpToolsStoreState();
}

class _HelpToolsStoreState extends State<HelpToolsStore> {
  List<HelpToolsItem> stores =[
      ];

 late  GameCubit gameCubit ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameCubit = GameCubit();
    gameCubit.loadShardPrefrance() ;
  }
  @override
  Widget build(BuildContext context) {


    stores =[
      HelpToolsItem(type: sharedhelpadd, price: 300, count: 5, money:  widget.money ,gameCubit: gameCubit , ) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 300, count: 2, money:  widget.money , gameCubit: gameCubit ) ,
      HelpToolsItem(type: sharedhelpadd, price: 500, count: 10, money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 500, count: 5, money:  widget.money ,gameCubit: gameCubit ) ,
      HelpToolsItem(type: sharedhelpadd, price: 1000, count: 15, money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 1000, count: 7, money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpadd, price: 3000, count: 20, money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 3000, count: 10 ,  money:  widget.money ,gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpadd, price: 5000, count: 25 ,  money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 5000, count: 15 ,  money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpadd, price: 7000, count: 30,  money:  widget.money , gameCubit: gameCubit) ,
      HelpToolsItem(type: sharedhelpcurrect, price: 7000, count: 20,  money:  widget.money , gameCubit: gameCubit) ,
    ];

    return ListView.builder(

        itemCount: stores.length,
        itemBuilder: (c , i ){
      return   stores[i] ;
    });
  }
}
