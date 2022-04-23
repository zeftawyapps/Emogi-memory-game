
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../values.dart';
class BacgGame  extends StatelessWidget {
  Widget? child ;

  BacgGame(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height ,
      decoration:  BoxDecoration(
          gradient: backgroungrideGame
      )
      ,
      child: FadeIn(child: child!),
    );
  }
}


class BacgSplach  extends StatelessWidget {
  Widget? child ;

  BacgSplach(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height ,
      decoration:  BoxDecoration(
          gradient: backgroungrideGame
      )
      ,
      child: child,
    );
  }
}