import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList(){
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context,int index){
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot){
            return Container(
              height: 80.0,
              child: snapshot.hasData
              ?Text('I.m visible $index')
              :Text('You can\'t see me $index'));
          },
        );
      },
    );
  }

  getFuture(){
    return Future.delayed(
      Duration(seconds: 1),
        () => 'hi',
      );
    }
}