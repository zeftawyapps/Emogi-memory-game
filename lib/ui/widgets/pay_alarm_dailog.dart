import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/procject_metiods.dart';
import '../values.dart';

class AlarmDialog extends StatelessWidget {
  AlarmDialog({Key? key, required this.containt, required this.title , required    this.playsound  ,
  required this.backgruod
  })
      : super(key: key);
  Widget containt;
  String title;
  String  playsound ;
  PlaySound play = PlaySound();
Color backgruod;
  @override
  Widget build(BuildContext context) {
    play.playPayment();
    return ZoomIn(
      child: Dialog(
        child: Container(

          decoration: BoxDecoration(
              color: backgruod ,


              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10)),
          height: 240.h,
          width: 500.w,
          child: Column(
            children: [
              Expanded(
                flex:  1 ,
                child: Container(
                    color: Color(0xff05321b),
                    child: Center(
                      child: Text('$title',
                          style:TextStyle(color: Colors.white , fontSize: 25) ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: containt,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bcbegcard,
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "OK",
                          style: TextStyle(fontSize: 24.sp, color: Colors.white),
                        )),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
