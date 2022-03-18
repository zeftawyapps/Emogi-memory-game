import 'package:flutter/material.dart';
import 'package:memory_game/ui/widgets/bcg.dart';
class Spach1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BacgSplach(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage('assite/img/logo.jpg'),
          ),
        ),
        Text(
          'mmmm',
          style: Theme.of(context).primaryTextTheme.headline1,
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
