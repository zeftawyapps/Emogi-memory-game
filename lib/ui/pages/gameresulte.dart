import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/logic/game_provider.dart';
import 'package:memory_game/logic/procject_metiods.dart';
import 'package:memory_game/logic/values.dart';
import 'package:memory_game/ui/pages/store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../values.dart';

class GameResultDailog extends StatefulWidget {
  bool iswin = false;
  int tryis = 0;
  int gamelevle = 0;
  int cardNom = 0;
  Color backGround;
  GameResultDailog(
      {required this.iswin,
        required this.backGround  ,
      this.tryis = 0,
      required this.gamelevle,
      required this.cardNom});

  @override
  _GameResultDailogState createState() => _GameResultDailogState();
}

class _GameResultDailogState extends State<GameResultDailog> {
  int myscors = 0;
  bool coinvesable = false;
  PlaySound play = PlaySound();
  double coins = 0;
  int? money;
  late GameProvider gameProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.iswin) {
      play.playwin();
    } else {
      play.playloss();
    }
  }

  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();
    if (money == null) {
      gameProvider.laodMoneyValue();
    }
    money = gameProvider.money;
    int scor = widget.tryis;
    if (widget.iswin) {
      Timer(Duration(milliseconds: 500), () {
        if (myscors < scor * 50) {
          Timer timer = Timer.periodic(Duration(milliseconds: 150), (t) {
            setState(() {
              myscors = myscors + 10;

              if (myscors > scor * 50) {
                int c = scor * 50 - widget.cardNom * 50;
                setState(() {
                  if (c > 0) {
                    if (c >= 10) {
                      coins = c + widget.cardNom * 5;
                    } else {
                      coins = widget.cardNom * 5;
                    }
                  } else {
                    coins = (widget.cardNom / 2) * 5;
                  }
                });
                t.cancel();
                coinvesable = true;
                play.playwinMomy();
              }
            });
          });
        }
      });
    } else {}
    return ZoomIn(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Dialog(
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  width: 400,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      color: widget .  backGround,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('level',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white)),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${widget.gamelevle}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                        ],
                      ),
                      Visibility(
                          visible: widget.iswin,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'scores',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('$myscors',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white))
                            ],
                          )),
                      Visibility(
                          visible: coinvesable,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(imageCoins),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text('${coins.toInt()}',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white))
                            ],
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        color: widget.backGround ,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                  onPressed: () {
                                    gameProvider.addMoney(coins.toInt());

                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                            Expanded(
                              child: MaterialButton(
                                  onPressed: () {
                                    showStore();
                                  },
                                  child: Icon(
                                    Icons.local_grocery_store,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                            Expanded(
                              child: Visibility(
                                visible: widget.iswin,
                                child: MaterialButton(
                                    onPressed: () async {
                                      int g = widget.gamelevle;
                                      SharedPreferences sharedPreferences =
                                          await SharedPreferences.getInstance();
                                      // gameProvider.restartgame();
                                      // gameProvider.game();
                                      sharedPreferences.setInt(
                                          sharedStages, g + 1);
                                      // sharedPreferences.setInt(
                                      //     sharedMoney, coins.toInt());

                                      gameProvider.addMoney(coins.toInt());

                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>GameSreen()  ) );

                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 3 - 30,
                  child: Container(
                      color: Color(0xff011e1e),
                      child: Text(widget.iswin ? 'win' : 'loss',
                          style: Theme.of(context).primaryTextTheme.headline2)),
                )
              ],
            )),
      ),
    );
  }
  Future showStore() async {
    return await showDialog(
        barrierDismissible:false ,
        context: context,
        builder: (_) {
          return GameStoresDialog(background: widget.backGround ,);
        });
  }

}
