import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}