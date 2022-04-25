import 'package:flutter/material.dart';
import 'package:memory_game/logic/game_contraller.dart';
import 'package:memory_game/logic/game_cubide/game_cubit.dart';
import 'package:memory_game/logic/imgvalues.dart';
import 'package:memory_game/ui/widgets/card_item.dart';

class GameGridView extends StatefulWidget {
  GameGridView({Key? key, required this.gameCubit}) : super(key: key);
  GameCubit gameCubit;
  @override
  State<GameGridView> createState() => _GameGridViewState();
}

class _GameGridViewState extends State<GameGridView> {
  double size =0 ;
  double aspcit = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    size = widget.gameCubit.fontsize();
    aspcit =    widget.gameCubit.aspectretio();

    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.gameCubit.gameConraller.colomesno,
              childAspectRatio:aspcit ),
          itemCount: widget.gameCubit.cards.length,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            return CardItem(
              gameCubit:  widget .gameCubit ,
                cardModule: widget.gameCubit.cards[i],
                cardclicked: (card) {
                  widget.gameCubit.clik(card, i)  ;
                },
                fontSize: size);
          }),
    );
  }
}
