import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/ui/widgets/grideview.dart';

import '../values.dart';
import '../widgets/bcg.dart';
import '../widgets/gameicons_icons.dart';

 class GameScreen extends StatefulWidget {
   const GameScreen({Key? key}) : super(key: key);

   @override
   State<GameScreen> createState() => _GameScreenState();
 }

 class _GameScreenState extends State<GameScreen> {
late   GameCubit gameCubit ;
bool currect = false ;
bool wrong  = false ;
bool helpadd = false ;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameCubit = GameCubit();
    gameCubit.gameInit();
  }
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: Container(child:

         BlocBuilder<GameCubit , GameStatus>(bloc: GameCubit(),
         builder: (c ,s ){
 return  WillPopScope(
   onWillPop: ()async  {
     SystemNavigator.pop();
     return false ;  },
   child: SafeArea(
     child: Scaffold(
       body: BlocConsumer<GameCubit , GameStatus>(
           listenWhen: (p,c)=>p!=c ,
         listener: (c , s ){
if (s is ResultCurrect){
  setState(() {
    currect = true ;

  });
  Timer(Duration(milliseconds: 500),(){
    setState(() {
currect = false ;
    });
  });

}
if (s is ResultWrong){
  setState(() {
    wrong = true ;

  });
  Timer(Duration(milliseconds: 500),(){
    setState(() {
      wrong = false ;
    });
  });

}
if (s is HelpAdd){
  setState(() {
    helpadd = true ;

  });
  Timer(Duration(milliseconds: 500),(){
    setState(() {
      helpadd = false ;
    });
  });
}
         },
         bloc: gameCubit,
         buildWhen: (p,c)=>p!=c ,
         builder: (context , s ) {
             // s is CardClick ||s is CardRotat || s is WaitToResult || s is Result || s is ResultDone
          if (s is GameLoading || s is GameStart ){
            return  BacgGame(Center(
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
                              // showDialog(
                              //     barrierDismissible: false ,
                              //     context: context, builder: (context){
                              //
                              //   return GameResult();
                              // });

                            }
                            ,child: Icon(Icons.settings,color: Colors.white ,size:24  ,))
                        , MaterialButton(
                            onPressed: (){
                              gameCubit.gameRestart() ;
                              // gamep.restartgame();
                              // setState(() {
                              //   gamep.game() ;
                              //   restart = true ;
                              //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Game_Sreen()  ) );
                              //
                              // });
                            }

                           ,child: Icon(Icons.replay ,color: Colors.white ,size:24  ,))
                       , MaterialButton(
                           onPressed: (){gameCubit.gameInit();  }
                           ,child: Icon(Icons.local_grocery_store ,color: Colors.white ,size:24  ,))

                     ],),
                 ),
                 Container(height:80,
                   child: Row(children: [
                     Container(height: 200,
                         child: Visibility(
                           visible: true ,
                           child: Stack(children: [
                             GestureDetector(
                               onTap: (){
                                 // gamep.helpcurect(context);
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
                                     Text("0",style: Theme.of(context).primaryTextTheme.bodyText1)

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
                             onTap: (){
                             gameCubit.helpAdd();
                               },
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
                                   Text(  gameCubit.helpAddTryis.toString() ,style: Theme.of(context).primaryTextTheme.bodyText1)

                                 ],),
                             ),),
                           ),
                         ],)
                     )
                     ,


                     Expanded(flex: 1,
                       child: Container(

                         child: Column(children: [
                           Text('level ',style: Theme.of(context).primaryTextTheme.headline6),
                           Text(gameCubit.gamelevle.toString(),style: Theme.of(context).primaryTextTheme.headline6)

                         ],),),
                     )
                     , Expanded(flex: 1,
                       child: AnimatedContainer(
                         duration: Duration(milliseconds: 200),
                         color: helpadd?Colors.green[700] :Colors.transparent,

                         child: AnimatedContainer(
duration: Duration(milliseconds: 200),
color: wrong?Colors.red[700] :Colors.transparent,
                           child: Column(children: [
                             Text('attempts',style: Theme.of(context).primaryTextTheme.headline6),
                             Text( gameCubit.gameConraller.trayes.toString() ,style: Theme.of(context).primaryTextTheme.headline5)

                           ],),),
                       ),
                     )

                     ,   Expanded(flex: 1,
                       child: AnimatedContainer(
duration: Duration(milliseconds: 200),
                         color: currect? Colors.green :Colors.transparent ,

                         child: Column(children: [
                           Text('scores',style: Theme.of(context).primaryTextTheme.headline6),
                           Text( gameCubit.gameConraller.scors.toString() ,style: Theme.of(context).primaryTextTheme.headline5)

                         ],),),
                     )
                   ],),
                 ) ,

                 Expanded(child:Stack(children: [

                   GameGridView(gameCubit: gameCubit) ,

                   Positioned(
                       right: 0,
                       child: AnimatedOpacity(
                           duration:  Duration(milliseconds: 200),
                           opacity: currect ?1:0,
                           child: Text("1+",style:  TextStyle(fontSize: 70 , color:  Colors.green),))),

                   Positioned(
                       right : 100,
                       child: AnimatedOpacity(
                           duration:  Duration(milliseconds: 200),
                           opacity: helpadd ?1:0,
                           child: Text("10+",style:  TextStyle(fontSize: 70 , color:  Colors.green),))),


                   Positioned(
                       right: 100.w,
                       child: AnimatedOpacity(
                           duration:  Duration(milliseconds: 200),
                           opacity: wrong ?1:0,
                           child: Text("2-",style:  TextStyle(fontSize: 70 , color:  Colors.red[700]),))),

                 ],) ),
                 Container(height: 40,)
               ],
             )
             ,
           ));
         }else{
            return Container();
          }

         }
       ),
     ),
   ),
 );

         },
         )
         ,),

     );
   }



 //
 }
