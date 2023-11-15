import 'package:flutter/material.dart';

class BackgroundSetting extends StatefulWidget {
  const BackgroundSetting({Key? key}) : super(key: key);

  @override
  State<BackgroundSetting> createState() => _BackgroundSettingState();
}

class _BackgroundSettingState extends State<BackgroundSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(child: GridView.builder(

        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3 ,
            childAspectRatio:1.00 ),
        itemCount:  6 ,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (c, i) {
          return Container() ;
        }),

    );
  }
}
