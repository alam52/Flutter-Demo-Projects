import 'package:animations/src/widgets/cat.dart';
import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  Widget build(context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Animations!'),
        ),
        body: buildAnimation(),
      );
  }

  Widget buildAnimation(){
    return Cat();
  } 
}