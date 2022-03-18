import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/logic/projprovider.dart';
import 'package:provider/provider.dart';
class Rotate extends StatefulWidget {
  Widget child1;
  Widget child2;
  bool animate;



    Rotate({  required this. child1 , required this. child2  , this.animate = false,  })  ;

  @override
  _RotateState createState() => _RotateState();
}

class _RotateState extends State<Rotate>  with TickerProviderStateMixin{
  late   AnimationController controller;
  late  Animation<double> animation;
  late  Timer _timer;
  ProjectProvider projectProvider = ProjectProvider();
  var  oneSec = const Duration(seconds: 1 );
  bool changecolor  =false ;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(seconds: 1), vsync: this)..addListener(() =>
        setState(() {}));
    animation = Tween(begin:  0.0, end: 1.5).animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    projectProvider = context.watch<ProjectProvider>();
    if(widget.animate) {
      controller.forward();
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (widget.animate) {
            controller.reverse();
            widget.animate = false;
            // projectProvider.setiscardrotated(widget.iscrard);
            setState(() {
              changecolor = !changecolor;
            });
          }
        }
      });
    }
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()..rotateY(animation.value),
        child:changecolor? widget.child1:widget.child2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


}


class MyZoomOut extends StatefulWidget {
  final Key? key;
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;
bool reserv ;
  MyZoomOut(
      {this.key,
        required this.child,
        this.duration = const Duration(milliseconds: 500),
        this.delay = const Duration(milliseconds: 0),
        this.controller,
        this.manualTrigger = false,
        this.animate = true,
        this.reserv = false ,
        this.from = 0.0})
      : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  _MyZoomOutState createState() => _MyZoomOutState();
}

/// State class, where the magic happens
class _MyZoomOutState extends State<MyZoomOut> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> zoom;
  late Animation<double> opacity;

  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    zoom = Tween(begin: 1.0, end: widget.from)
        .animate(CurvedAnimation(curve: Curves.easeOut, parent: controller!));

    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller!, curve: Interval(0, 0.65)));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
    if (widget.reserv){
     controller!.reverse();
  }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: zoom.value,
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        });
  }
}
