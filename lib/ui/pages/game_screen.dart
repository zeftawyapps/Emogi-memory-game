import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';

 class GameScreen extends StatefulWidget {
   const GameScreen({Key? key}) : super(key: key);

   @override
   State<GameScreen> createState() => _GameScreenState();
 }

 class _GameScreenState extends State<GameScreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(child:

         BlocBuilder<GameCubit , GameState>(bloc: GameCubit(),
         builder: (c ,s ){
 return Container();

         },
         )
         ,),

     );
   }
 }
