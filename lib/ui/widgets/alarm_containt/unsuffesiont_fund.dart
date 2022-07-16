import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';

import '../../values.dart';

class ContentUnsuffes extends StatefulWidget {
  ContentUnsuffes({Key? key, required this.state, required this.gameCubit})
      : super(key: key);
  int state = 1;
  GameCubit gameCubit;

  @override
  State<ContentUnsuffes> createState() => _ContentUnsuffesState();
}

class _ContentUnsuffesState extends State<ContentUnsuffes> {
  bool notmony = false;

  bool adsVisablity =false ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    adsVisablity =  widget.gameCubit.rewardedAd != null ? true : false;

}
  @override
  Widget build(BuildContext context) {
    if (widget.state == 1) {
      notmony = true;
    } else {
      notmony = false;
    }
    return Column(
      children: [
        Text(
          getMassage(),
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        Visibility(
            visible: adsVisablity ,
            child: Row(
              children: [
                MaterialButton(
                    onPressed: () {
                      widget.gameCubit.initRewardedAdsLesteners(widget.state);
                      widget.gameCubit.rewardShow();
                      setState(() {
                        adsVisablity = false ;
                      });
                    },
                    child: Image(image: AssetImage(imageAds) ,height: 20.h, width: 20.w ,) ),
                Text(getAdding(), style: TextStyle(fontSize: 10.sp ,color: Colors.white),)
              ],
            ))
      ],
    );
  }

  String getMassage() {
    switch (widget.state) {
      case 1:
        return "Money not found ";
      case 2:
        return "Help to add not found ";
      case 3:
        return "Help to currect card not found ";
      default:
        return "Money Not found ";
    }
  }

  String getAdding() {
    switch (widget.state) {
      case 1:
        return "";
      case 2:
        return "Add 5 of   Help to add  ";
      case 3:
        return "Add 2 of  Help to currect card  ";
      default:
        return "";
    }
  }

}
