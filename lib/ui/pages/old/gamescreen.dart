import 'dart:async';


import 'package:animate_do/animate_do.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:memory_game/logic/gameprovider.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/logic/projprovider.dart';
import 'package:memory_game/ui/pages/gameresulte.dart';
import 'package:memory_game/ui/widgets/animations.dart';
import 'package:memory_game/ui/widgets/bcg.dart';
import 'package:memory_game/ui/widgets/gameicons_icons.dart';
import 'package:provider/provider.dart';


import '../values.dart';
class Game_Sreen extends StatefulWidget {
  // const Game_Sreen({Key key}) : super(key: key);

  @override
  _Game_SreenState createState() => _Game_SreenState();
}

class _Game_SreenState extends State<Game_Sreen>    with TickerProviderStateMixin {
 GameProvider gamep = GameProvider();
int? click1 , click2 ,colomno = 2 ;
 final controller = DragSelectGridViewController();

late  Timer _timer;
 bool isvalueshown = false ;
 var  oneSec = const Duration(seconds: 1);
bool restart=false ;
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
    return WillPopScope(
      onWillPop: ()async  {
        SystemNavigator.pop();
        return false ;  },
      child: SafeArea(
        child: Scaffold(
          body: BacgGame(Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
            Container(height: 40,
              color:Color(0x79110F0F),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                MaterialButton(
                    onPressed: (){
                      showDialog(
                          barrierDismissible: false ,
                          context: context, builder: (context){

                        return GameResult();
                      });

                    }
                    ,child: Icon(Icons.settings,color: Colors.white ,size:24  ,))
                 , MaterialButton(
                      onPressed: (){
                        gamep.restartgame();
                        setState(() {
                         gamep.game() ;
                          restart = true ;
                           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Game_Sreen()  ) );

                        });
                                           }
                      ,child: Icon(Icons.replay ,color: Colors.white ,size:24  ,))
                  , MaterialButton(
                      onPressed: (){ }
                      ,child: Icon(Icons.local_grocery_store ,color: Colors.white ,size:24  ,))

              ],),
            ),
          Container(height:80,
            child: Row(children: [
              Expanded(flex: 1,
                  child: Visibility(
                    visible: gamep.counter==1,
                    child: Stack(children: [
                      GestureDetector(
                        onTap: (){
                          gamep.helpcurect(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(color:

                          bcbegGamebtn
                              ,  border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10)
                          )
                          ,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Gameicons.ok,color: Colors.white ,size:28  ,),
                              Text(gamep.hacurrectcard.toString(),style: Theme.of(context).primaryTextTheme.bodyText1)

                            ],),
                        ),),
                      ),
                    ],),
                  )
              )
              ,

              Expanded(flex: 1,
                child: Stack(children: [
                  GestureDetector(
                    onTap: (){gamep.helpAdd(); },
                    child: Container(
                      decoration: BoxDecoration(color:

                      bcbegGamebtn
                          ,  border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10)
                      )
                      ,   child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Icon(Icons.add,color: Colors.white ,size:28  ,),
                        Text( gamep.haddtryis.toString() ,style: Theme.of(context).primaryTextTheme.bodyText1)

                    ],),
                      ),),
                  ),
                ],)
              )
              ,


              Expanded(flex: 1,
                child: Container(

                  child: Column(children: [
                  Text('المستوى',style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text("${gamep.gamelevle}",style: Theme.of(context).primaryTextTheme.bodyText1)

                ],),),
              )
             , Expanded(flex: 1,
                child: Container(


                  child: Column(children: [
                  Text('محاولات',style: Theme.of(context).primaryTextTheme.bodyText2),
                  Text(gamep.trayes.toString(),style: Theme.of(context).primaryTextTheme.bodyText1)

                ],),),
              )

           ,   Expanded(flex: 1,
                child: Container(


                  child: Column(children: [
                  Text('نتيجة',style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text(gamep.myscors.toString() ,style: Theme.of(context).primaryTextTheme.bodyText1)

                ],),),
              )
            ],),
          ) ,

 Expanded(child:Stack(children: [
   buildGridView()
 ],) ),
Container(height: 10,)
  ],
          )
            ,
          )),
        ),
      ),
    );
  }




 var refreshKey = GlobalKey<RefreshIndicatorState>();



 GridView buildGridView() {
 gamep.cards.map((e) =>
   print("state my stat ${e.state}")
 );
    return GridView.builder(
      key: ObjectKey(gamep.cards),
        shrinkWrap: true,
gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: colomno!,
  childAspectRatio:aspectretio()
),
  itemCount: gamep.cards.length,
  itemBuilder: (context , i ){

String v = '3';
 v = gamep.cards[i].imagesv;


return MaterialButton(
    enableFeedback: gamep . counter !=2,
    onPressed: (){
  if (i == gamep.clicki1 ){return ; }
  if (gamep . counter ==2 ){return ; }
  if (gamep.cards[i].state == 2){return ; }
    setState(() {



    gamep.tryesloss1();
    gamep.cards[i].state = 1;
    if (gamep. counter ==0 ){gamep . c1 = v ;gamep . counter ++; gamep . clicki1 = i ; }else
    if (gamep . counter ==1 ){
    gamep.c2 = v ; gamep . clicki2 = i ;
    gamep . counter ++;

    _timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
    if (gamep.matching(gamep. c1, gamep . c2)){
    setState(() {
    gamep.cards[gamep.clicki1].state = 2;
    gamep.cards[gamep.clicki2].state = 2;
    gamep.scoresadd1();
  if  ( gamep.winning()){

    showDialog(
        barrierDismissible: false ,
        context: context, builder: (context){

      return GameResult();
    });

  }
    });
    }else {
    setState(() {
      gamep.cards[gamep.clicki1].state = 0;
    gamep.cards[gamep.clicki2].state = 0;
    iscrardrot = false ;
    gamep.clicki1 =100;
if (gamep.losseing()){
  showDialog(context: context, builder: (context){

    return GameResult();
  });

}
    });
    }
    timer.cancel();
    gamep . counter =0 ;
    });

    }}
     );

    },
  child:MyZoomOut(duration: Duration(seconds: 1),
    animate:gamep.cards[i].state == 2 ,
    reserv:  restart ,
    child: FadeInRight(
      child:   gamep.cards[i].state != 1?
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Card(
          elevation: 10,

          borderOnForeground:  true  ,
          child:

          Container(

            decoration: BoxDecoration(color:

            Color( 0xffa68309)
                ,  border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10)
            )
            ,child: Center(
            child:  Text(   '?'  ,style:TextStyle(fontSize: fontsize() , color:  Colors.white),
              textAlign: TextAlign.center,),
          ),
          ),
        ),
      ) :
      FadeIn(
        duration: Duration(seconds: 1),
        animate:gamep.cards[i].state==1 ,
        child: Card(
          elevation: 10,
          child: Container(


              decoration: BoxDecoration(color:

              Color(0xffefe8d6)
                  ,  border: Border.all(color: Colors.blueAccent)
              )
              ,child: Center(
            child:  Text(   v  ,style: TextStyle(fontSize: fontsize(),color:Colors.white ) ,
              textAlign: TextAlign.center,),
          )

          ),
        ),
      ),
    ),
  )


);
  });}


double  aspectretio(){

      switch(colomno){
        case  2 :
          if (gamep.cardnum==6){
          return 1.00;}else{return 1.35; }
        case  3 :

           return .9 ;
        case  4 :

switch (gamep.cardnum){
  case 20 : return 0.90;
  case 24: return 1 ;
  case 28 : return 1.1 ;
}
      }
      return 1.30;
}


 double    fontsize(){

   switch(colomno){
     case  2 : return 35;
     case  3 : return 30;
     case  4 : return 20;
   }
   return 10;
 }
  //
}
