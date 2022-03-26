import 'dart:async';

import 'package:flutter/material.dart';

  class Relaodscrean extends StatefulWidget {
  const Relaodscrean({Key? key}) : super(key: key);

  @override
  _RelaodscreanState createState() => _RelaodscreanState();
}

class _RelaodscreanState extends State<Relaodscrean> {
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 1 ), (Timer  t ) {

    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Game_Sreen()  ) );
    });
    return Container(
      child: Center(child: Text('reloading '),),
    );
  }
}
