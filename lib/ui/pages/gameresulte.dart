import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memory_game/logic/gameprovider.dart';
import 'package:memory_game/logic/values.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../values.dart';
import 'gamescreen.dart';


class GameResult extends StatefulWidget  {
  @override
  _GameResultState createState() => _GameResultState();
}
class _GameResultState extends State<GameResult> {
  int myscors = 0 ;

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider =context.watch<GameProvider>();
int scor = gameProvider.scores;
if (myscors <scor) {
  Timer timer = Timer.periodic(Duration(milliseconds: 100), (t) {
    setState(() {
      myscors = myscors + 10;
    });
    if (myscors > scor) {
      t.cancel();
    }
  });
}
    return ZoomIn(
      child: WillPopScope(
        onWillPop: ()async  {
          SystemNavigator.pop();
          return false ;  },
        child: Dialog(

shape: RoundedRectangleBorder(),
backgroundColor: Colors.transparent,
          child: Stack(
            children: [

             Container(
                width: 400 , 
               height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    color: bcbeg3,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  Text( '${gameProvider.gamelevle}' ,style: Theme.of(context).primaryTextTheme.headline2),


                  Visibility(
                      visible: gameProvider.iswin,
                      child: Text( '$myscors' ,style: Theme.of(context).primaryTextTheme.headline4)),
                    SizedBox(height: 100,),
                  Container(height: 40,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                          Expanded(
                            child: MaterialButton(
                              onPressed: (){
                                gameProvider.restartgame();


gameProvider.setwining();

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Game_Sreen()  ) );


                              }
                              ,child: Icon(Icons.replay ,color: Colors.white ,size:24  ,)),
                          )
                        , Expanded(
                          child: MaterialButton(
                              onPressed: (){ }
                              ,child: Icon(Icons.local_grocery_store ,color: Colors.white ,size:24  ,)),
                        )
,  Expanded(
  child:   Visibility(
                            visible: gameProvider.iswin,
                            child: MaterialButton(
                                onPressed: () async {
                                  int g = gameProvider.gamelevle ;
                                  SharedPreferences   sharedPreferences = await SharedPreferences.getInstance();
                                  gameProvider.restartgame() ;
                                  gameProvider.game() ;
                                  sharedPreferences.setInt( sharedStages , g +1 ) ;

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Game_Sreen()  ) );


                                }
                                ,child: Icon(Icons.play_arrow,color: Colors.white ,size:24  ,)),
                          ),
)
                      ],),
                  ),

                ],),

              ),
            Positioned(
              left: MediaQuery.of(context).size.width/3-30,
              child: Container(
                  color: Color(0xdd683503),
                  child: Text(gameProvider.iswin? 'win':'loss',style: Theme.of(context).primaryTextTheme.headline4)),
            )
            ],
          )),
      ),
    );

  }
}
