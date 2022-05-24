import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_provider.dart';
import 'package:memory_game/logic/store_cubit/store_cubit.dart';

import '../values.dart';
 class MonyCounter extends StatefulWidget {
     MonyCounter({Key? key ,required this.money  }) : super(key: key);
 int  money  ;
   @override
   State<MonyCounter> createState() => _MonyCounterState();
 }

 class _MonyCounterState extends State<MonyCounter> {
  @override
  void initState()   {
    // TODO: implement initState
    super.initState();


 }
   @override
   Widget build(BuildContext context) {
return Container(
       child:    Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             width: 50,height: 50,
             child:  Image.asset(imageCoins) ,)
           ,
           SizedBox(width:  30.w ,) ,

           Text('${widget .money }',
               style: TextStyle(fontSize: 40.sp , color: Colors.white)

           )

         ],)
     );
   }
 }
