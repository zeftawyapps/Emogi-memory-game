import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/values.dart';
import '../../values.dart';
import '../gameicons_icons.dart';
class ContentPayFromStoreDialog extends StatelessWidget {
    ContentPayFromStoreDialog({Key? key , required this.count , required this.type   }) : super(key: key);
    String type;
    int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 30,
            height: 50,
            decoration: BoxDecoration(
                color: bcbegGamebtn,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(
                type == sharedhelpadd ? Icons.add : Gameicons.ok,
                color: Colors.white,
                size: 20.sp ,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5 ,
          child: Text(
            "   $count  Added",
            style: TextStyle(fontSize: 25.sp, color: Colors.white),
          ),
        ),
      ],
    );

  }
}
