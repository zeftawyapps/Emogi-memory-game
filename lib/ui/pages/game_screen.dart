import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/ui/pages/gameresulte.dart';
import 'package:memory_game/ui/pages/store.dart';
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
  late GameCubit gameCubit;
  bool currect = false;
  bool wrong = false;
  bool helpadd = false;
  bool lowAttempet = false;
  bool lowAttempetAlarm = false;

  bool helpCurrect = false;
  bool helpCurrectEnable = false;
  String _showAttmete = "-2";
  bool showAttemetsEnable = false;
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameCubit = GameCubit();

    gameCubit.gameInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: BlocBuilder<GameCubit, GameStatus>(
          bloc: GameCubit(),
          builder: (c, s) {
            return WillPopScope(
              onWillPop: () async {
                SystemNavigator.pop();
                return false;
              },
              child: SafeArea(
                child: Scaffold(
                  body: BlocConsumer<GameCubit, GameStatus>(
                      listenWhen: (p, c) => p != c,
                      listener: (c, s) {
                        if (s is AttemetLow) {

                         setState(() {
                           lowAttempet = true ;
                         });


                        }
                        if (s is AttemetNotLow) {
                          setState(() {
                            setState(() {
                              lowAttempet = false  ;
                            });
                          });
                        }
                        if (s is StoreClosed) {
                          gameCubit.loadSavedDataWithoutinit();
                        }
                        if (s is HelpAddPayed) {
                          gameCubit.loadSavedDataWithoutinit();
                        }
                        if (s is HelpCorroctPued) {
                          gameCubit.loadSavedDataWithoutinit();
                        }
                        if (s is Winner) {
                          showWin()
                              .then((value) => {gameCubit.gameNextLevel()});
                        }
                        if (s is Losser) {
                          {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) {
                                  return GameResultDailog(
                                    backGround:
                                        gameCubit.stageConfigs.dailogcolor!,
                                    iswin: false,
                                    tryis: 0,
                                    cardNom: gameCubit.gameConraller.cardnum,
                                    gamelevle:
                                        gameCubit.gameConraller.gamelevle,
                                  );
                                }).then((value) => {gameCubit.gameRestart()});
                          }
                        }
                        if (s is ResultCurrect) {
                          setState(() {
                            currect = true;
                          });
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              currect = false;
                            });
                          });
                          gameCubit.switchGameOver();
                        }
                        if (s is ResultWrong) {
                          gameCubit.checkIfAttempetIsLow();
                          setState(() {
                            wrong = true;
                          });
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              wrong = false;
                            });
                          });

                          gameCubit.switchGameOver();
                        }
                        if (s is HelpAdd) {
                          setState(() {
                            helpadd = true;
                            lowAttempet = false ;
                          });
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              helpadd = false;
                            });
                          });
                        }
                        if (s is ClickedCard1) {
                          setState(() {
                            helpCurrectEnable = true;
                          });
                        } else {
                          setState(() {
                            helpCurrectEnable = false;
                          });
                        }
                      },
                      bloc: gameCubit,
                      buildWhen: (p, c) => p != c,
                      builder: (context, s) {

                        // s is CardClick ||s is CardRotat || s is WaitToResult || s is Result || s is ResultDone
                        if (s is GameLoading || s is GameStart) {
                          return BacgGame(
                            child: Column(
                              children: [
                                Container(
                                  height: 40.h,
                                  color: Color(0x79110F0F),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.settings,
                                            color: Colors.white,
                                            size: 24.sp,
                                          )),
                                      MaterialButton(
                                          onPressed: () {
                                             gameCubit.gameRestart();
                                          },
                                          child: Icon(
                                            Icons.replay,
                                            color: Colors.white,
                                            size: 24.sp,
                                          )),
                                      MaterialButton(
                                          onPressed: () {
                                            showStore();
                                          },
                                          child: Icon(
                                            Icons.local_grocery_store,
                                            color: Colors.white,
                                            size: 24.sp,
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Color(0x1D110F0F),
                                  height: 80.h,
                                  child: Row(
                                    children: [
                                      AnimatedOpacity(
                                        duration: Duration(milliseconds: 200),
                                        opacity: helpCurrectEnable ? 1 : 0,
                                        child: Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                gameCubit.helpcurect();
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                decoration: BoxDecoration(
                                                    color: gameCubit
                                                        .stageConfigs
                                                        .helpcardsColor,
                                                    border: Border.all(
                                                        color: lowAttempet
                                                            ? Colors.red
                                                            : Colors.blueAccent,
                                                        width: lowAttempet
                                                            ? 2
                                                            : 0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Gameicons.ok,
                                                        color: Colors.white,
                                                        size: 28.sp,
                                                      ),
                                                      Text(
                                                          gameCubit
                                                              .helpAddCurrectCard
                                                              .toString(),
                                                          style: Theme.of(
                                                                  context)
                                                              .primaryTextTheme
                                                              .bodyText1)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                gameCubit.helpAdd();
                                              },
                                              child: Stack(
                                                children: [
                                                  Center(
                                                    child: AnimatedContainer(
                                                      duration:Duration(milliseconds: 500) ,
                                                      decoration: BoxDecoration(
                                                          color: gameCubit
                                                              .stageConfigs
                                                              .helpcardsColor,
                                                          border: Border.all(
                                                              color: lowAttempet
                                                                  ? Colors.red
                                                                  : Colors.blueAccent,
                                                              width: lowAttempet
                                                                  ? 2
                                                                  : 0),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Icon(
                                                              Icons.add,
                                                              color: Colors.white,
                                                              size: 28,
                                                            ),
                                                            Text(
                                                                gameCubit
                                                                    .helpAddTryis
                                                                    .toString(),
                                                                style: Theme.of(
                                                                    context)
                                                                    .primaryTextTheme
                                                                    .bodyText1)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AnimatedContainer(

                                                    duration:Duration(milliseconds: 500) ,
                                                    color: lowAttempet  ?  Color(
                                                        0x4BF8000C) :Colors.transparent,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                'level ',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                gameCubit.gamelevle.toString(),
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          color: helpadd
                                              ? Colors.green[700]
                                              : Colors.transparent,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            color: wrong
                                                ? Colors.red[700]
                                                : Colors.transparent,
                                            child: Column(
                                              children: [
                                                Text('attempts',
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.white)),
                                                Text(
                                                  gameCubit.gameConraller.trayes
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          color: currect
                                              ? Colors.green
                                              : Colors.transparent,
                                          child: Column(
                                            children: [
                                              Text(
                                                'points',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                gameCubit.gameConraller.scors
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height -
                                      200.h,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: GameGridView(
                                              gameCubit: gameCubit)),
                                      Positioned(
                                          right: 0,
                                          child: AnimatedOpacity(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              opacity: currect ? 1 : 0,
                                              child: Text(
                                                "2+",
                                                style: TextStyle(
                                                    fontSize: 40.sp,
                                                    color: Colors.green),
                                              ))),
                                      Positioned(
                                          right: 100,
                                          child: AnimatedOpacity(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              opacity: helpadd ? 1 : 0,
                                              child: Text(
                                                "10+",
                                                style: TextStyle(
                                                    fontSize: 40.sp,
                                                    color: Colors.green),
                                              ))),
                                      Positioned(
                                          right: 100.w,
                                          child: AnimatedOpacity(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              opacity: wrong ? 1 : 0,
                                              child: Text(
                                                "2-",
                                                style: TextStyle(
                                                    fontSize: 40.sp,
                                                    color: Colors.red[700]),
                                              ))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            background: gameCubit.stageConfigs.background!,
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future showWin() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return GameResultDailog(
            backGround: gameCubit.stageConfigs.dailogcolor!,
            cardNom: gameCubit.gameConraller.cardnum,
            iswin: true,
            tryis: gameCubit.gameConraller.trayes,
            gamelevle: gameCubit.gameConraller.gamelevle,
          );
        });
  }

  Future showStore() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return GameStoresDialog(
            background: gameCubit.stageConfigs.dailogcolor!,
          );
        }).then((value) => gameCubit.storeClosed());
  }

//
}
