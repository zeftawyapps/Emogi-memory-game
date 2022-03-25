import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/ui/widgets/animations.dart';

class CardItem extends StatefulWidget {
  CardItem(
      {Key? key,
      required this.cardModule,
      required this.cardclicked,
      required this.fontSize,
      required this.gameCubit})
      : super(key: key);
  CardModule cardModule;
  Function(CardModule cardModule) cardclicked;
  double fontSize;
  GameCubit gameCubit;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool annimate = false;
  bool isNoAction = false;
  bool desapper = false;
  bool loadgame = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.gameCubit,
      listener: (c, s) {
        if (s is GameLoading) {
          loadgame = true;
        }
        if (s is GameStart) {
          loadgame = false;
        }
        if (s is CardRotat || s is WaitToResult) {
          isNoAction = true;
        }
        if (s is ResultDone || s is CardClick) {
          isNoAction = false;
        }
        if (s is ResultWrong) {
          if (widget.cardModule.result == WRONG_CHOOSe) {
            annimate = true;

            Timer(Duration(milliseconds: 300), () {
              setState(() {
                annimate = false;
                widget.gameCubit.resultDone(widget.cardModule);
              });
            });
          }
        }

        if (s is ResultCurrect) {
          Timer(Duration(milliseconds: 300), () {
            setState(() {
              annimate = false;
              widget.gameCubit.resultDone(widget.cardModule);
            });
          });
        }
      },
      listenWhen: (p, c) => p != c,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: widget.cardModule.result != MATCHED ? 1.0 : 00.0,
        child: GestureDetector(
            onTap: () {
              if (isNoAction) {
                return;
              }
              if (!widget.cardModule.isclicked) {
                if (!annimate) {
                  Timer(Duration(milliseconds: 400), () {
                    setState(() {
                      annimate = false;

                      loadgame = false;
                    });
                  });
                  widget.cardclicked(widget.cardModule);
                  setState(() {
                    annimate = true;
                  });
                }
              }
            },
            child: Rotate(
              toMainFace: loadgame,
              animate: annimate,
              child2: Container(
                decoration: BoxDecoration(
                    color: Color(0xffa68309),
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    '?',
                    style: TextStyle(
                        fontSize: widget.fontSize, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              child1: Container(
                decoration: BoxDecoration(
                    color: Color(0xffefe8d6),
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    widget.cardModule.imagesv,
                    style: TextStyle(
                        fontSize: widget.fontSize, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              animationCompleted: () {},
            )),
      ),
    );
  }
}
