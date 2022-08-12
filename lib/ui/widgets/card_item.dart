import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/ui/values.dart';
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
          // isNoAction = false ;

        }
        if (s is CardRotat || s is WaitToResult) {
          // isNoAction = true;
        }
        if (s is HelpCorroct) {
          if (!widget.cardModule.isclicked) {
            if (widget.cardModule.result == IS_CHOSSED) {
              annimate = true;
              // isNoAction = true;
              Timer(Duration(milliseconds: 400), () {
                setState(() {
                  annimate = false;

                  loadgame = false;
                });
              });
            }
          }
        }
        if (s is ClickedCard1) {
          Timer(Duration(milliseconds: 700), () {
            // isNoAction = false;
          });
        }
        if (s is ResultDone) {
          if (widget.cardModule.result == MATCHED) {
            // isNoAction = true;
          } else {
            Timer(Duration(milliseconds: 700), () {
              // isNoAction = false;
            });
          }
        }
        if (s is ResultWrong) {
          // isNoAction = true  ;
          if (widget.cardModule.result == WRONG_CHOOSe) {
            annimate = true;

            Timer(Duration(milliseconds: 400), () {
              setState(() {
                annimate = false;
                widget.gameCubit.resultDone(widget.cardModule);
              });
            });
          }
        }

        if (s is ResultCurrect) {
          // isNoAction = true  ;

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
              int i;
              if (widget.gameCubit.isNoAction ||
                  widget.cardModule.result == MATCHED) {
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
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x54030303),
                        offset: Offset(5.0, 5.0),
                      )
                    ],
                    color: widget.gameCubit.stageConfigs.cardOfColor,

                    // border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20)),
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
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x54030303),
                        offset: Offset(5.0, 5.0),
                      )
                    ],
                    color: widget.gameCubit.stageConfigs.cardOnColor,

                    // border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20)),
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
