import 'dart:async';


import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/logic/gameprovider.dart';
 import 'package:memory_game/ui/widgets/animations.dart';
import 'package:provider/provider.dart';

import 'package:animate_do/animate_do.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/ui/widgets/animations.dart';
import 'package:memory_game/ui/widgets/bcg.dart';
import 'package:provider/provider.dart';

import '../../../logic/projprovider.dart';


class Testanim extends StatefulWidget {
  const Testanim({Key? key}) : super(key: key);

  @override
  _TestanimState createState() => _TestanimState();
}

class _TestanimState extends State<Testanim> {
  bool setanim = false ;bool setcolors =false ;
  ProjectProvider projectProvider = ProjectProvider();

  @override
  Widget build(BuildContext context) {
    projectProvider = context.watch<ProjectProvider>();
    return Scaffold(
      body: Container(
        child: Column(
           children: [
             Center(
               child: Rotate(animate: setanim ,
 child2: Container(
   color:  Colors.blue ,
   width: 100  ,height: 100 ,
 ),
                   child1: Container(
                     color:  Colors.green ,
                 width: 100  ,height: 100 ,
               )),
             )
             ,MaterialButton(onPressed: (){
setState(() {
  setanim = true;
  setcolors =!setcolors;
});

             }
             ,child: Text('+' , style: TextStyle(fontSize: 20),)
             )
           ],
        ),
      ),
    );
  }
}

class Game_Sreentes extends StatefulWidget {
  // const Game_Sreen({Key key}) : super(key: key);

  @override
  _Game_SreenState createState() => _Game_SreenState();
}

class _Game_SreenState extends State<Game_Sreentes>    with TickerProviderStateMixin {
  GameProvider gamep = GameProvider();
  int? click1 , click2 ,colomno = 2 ;
  final controller = DragSelectGridViewController();

  late  Timer _timer;
  bool isvalueshown = false ;
  var  oneSec = const Duration(seconds: 1);

  var squareScaleA = 0.5;
  ProjectProvider projectProvider = ProjectProvider();
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState



    super.initState();


  }
  bool setanimated =false ;
  bool iscrardrot = false ;
  @override
  Widget build(BuildContext context) {
    gamep = context.watch<GameProvider>();
    projectProvider = context.watch<ProjectProvider>();
    colomno = gamep.colomesno ;

    if (  !gamep.isgamestarted){
      gamep.game();}
    return BacgGame(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: 20,height: 100,
            duration: Duration(seconds: 1 ),
            decoration: BoxDecoration(color:  setanimated?Colors.green:Colors.yellowAccent) ,) ,
          SizedBox(height: 20,) ,
          Expanded(child: buildGridView()),

        ],
      )
      ,
    ));
  }







  GridView buildGridView() {
    return GridView.builder(
        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colomno!,
            childAspectRatio:colomno == 2 ?  1.5: 1
        ),
        itemCount: gamep.cards.length,
        itemBuilder: (context , i ){

          String v = '3';
          v = gamep.cards[i].imagesv;


          return MaterialButton(onPressed: (){
            setState(() {
              {    if (i == gamep.clicki1 ){return ; }
              gamep.cards[i].state = 1;
              if (gamep. counter ==0 ){gamep . c1 = v ;gamep . counter ++; gamep . clicki1 = i ; }else
              if (gamep . counter ==1 ){
                gamep.c2 = v ;gamep . counter =0 ;gamep . clicki2 = i ;


                _timer = new Timer.periodic(
                    oneSec,
                        (Timer timer) {
                      if (gamep.matching(gamep. c1, gamep . c2)){
                        setState(() {
                          gamep.cards[gamep.clicki1].state = 2;
                          gamep.cards[gamep.clicki2].state = 2;
                        });
                      }else {
                        setState(() {
                          gamep.cards[gamep.clicki1].state = 0;
                          gamep.cards[gamep.clicki2].state = 0;
                          iscrardrot = false ;

                        });
                      }
                      timer.cancel();
                    });

              }}
            });

          },
              child :
              ZoomOut(duration: Duration(seconds: 1),
                animate:gamep.cards[i].state == 2 ,
                child: FadeInRight(
                  child:   gamep.cards[i].state != 1?
                  Card(
                    elevation: 10,
                    child:

                    Container(

                      decoration: BoxDecoration(color:

                      Color( 0xffa68309)
                          ,  border: Border.all(color: Colors.blueAccent)
                      )
                      ,child:

                    Center(
                      child:  Text(   '?'  ,style: Theme.of(context).primaryTextTheme.headline1,
                        textAlign: TextAlign.center,),
                    ),
                    ),
                  ) :
                  FadeIn(
                    duration: Duration(seconds: 1),
                    animate:gamep.cards[i].state==1 ,
                    child: Card(
                      elevation: 10,
                      child:

                     Container(


                        decoration: BoxDecoration(color:

                        Color(0xffefe8d6)
                            ,  border: Border.all(color: Colors.blueAccent)
                        )
                        ,child: Center(
                        child:  Text(   v  ,style: Theme.of(context).primaryTextTheme.headline1,
                          textAlign: TextAlign.center,),
                      )

                      ),
                    ),
                  ),
                ),
              )


          );
        });}



//

}

