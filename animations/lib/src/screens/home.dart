import 'package:animations/src/widgets/cat.dart';
import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin{

  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> boxAnimation;
  AnimationController boxController;

  initState(){
    super.initState();

    boxController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    boxAnimation = Tween(begin: pi*.6, end: pi*.65).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeIn,
      ),
    );

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    catAnimation = Tween(begin: -20.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      )
    );
    boxAnimation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        boxController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        boxController.forward();
      }
    });
    boxController.forward();
  }

  onTap(){
    
    if(catController.status == AnimationStatus.completed){
      catController.reverse();
      boxController.forward();
    }
    else if(catController.status == AnimationStatus.dismissed){
      catController.forward();
      boxController.stop();
    }
  }

  Widget build(context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Animations!'),
        ),
        body: GestureDetector(
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          ),
          onTap: onTap,
        )
      );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child){
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  } 

  Widget buildBox(){
    return Container(
      height: 200.00,
      width: 200.00,
      color: Colors.brown,
    );
  }
 Widget buildLeftFlap(){
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child:  Container(
          height: 20.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context,child){
          return Transform.rotate(
            child: child,
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
          );
        },
      ),
    );
  }

  Widget buildRightFlap(){
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child:  Container(
          height: 20.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context,child){
          return Transform.rotate(
            child: child,
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
          );
        },
      ),
    );
  }
}