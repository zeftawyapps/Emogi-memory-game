import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../logic/procject_metiods.dart';
import '../../../logic/values.dart';
import '../../values.dart';
import '../gameicons_icons.dart';

class RateAppDealoge extends StatefulWidget {
  RateAppDealoge({Key? key ,
  required this.backgruod
})
: super(key: key);

// String  playsound ;
// PlaySound play = PlaySound();
Color backgruod;
  @override
  State<RateAppDealoge> createState() => _RateAppDealogeState();
}

class _RateAppDealogeState extends State<RateAppDealoge> {
RateMyApp? rateMyApp ;

  String rateAndroid = "com.zeftawyapps.gams.memory.memory_game";

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Dialog(
        child: Container(

          decoration: BoxDecoration(
              color:widget .  backgruod ,


              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10)),
          height: 240.h,
          width: 500.w,
          child:reteApp()

        ),
      ),
    );
  }

    Widget reteApp  (){
    return


      RateMyAppBuilder(
        onInitialized: (co, rate) {},
        builder: (BuildContext context) {
          return RateMyAppBuilder(
            rateMyApp: RateMyApp(googlePlayIdentifier: rateAndroid),
            builder: (BuildContext context) {
              return   Column(
                children: [
                  Expanded(
                    flex:  1 ,
                    child: Container(
                         child: Center(
                          child: Text('Rate app ',
                              style:TextStyle(color: Colors.white , fontSize: 25) ),
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child:  Text("Please rate Us",
                      style: TextStyle(fontSize: 20.sp , color: Colors.white),

                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        MaterialButton(
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
                                    "not naw ",
                                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                                  )),
                            ),
                          ),
                        ) ,
                        MaterialButton(
                          onPressed: () async {
                            this.rateMyApp!.launchStore().then((value) =>   Navigator.pop(context) );
                           var sharedPreferences =   await SharedPreferences.getInstance();
                            sharedPreferences.setBool(
                                sharedRateApp, true );
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
                                    "Rate",
                                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                                  )),
                            ),
                          ),
                        )

                      ],))

                ],
              ) ;  ;
            },
            onInitialized: (BuildContext context, RateMyApp rateMyApp) {
this.rateMyApp = rateMyApp ;
            },
          );
        },
      ) ;
    }


}
