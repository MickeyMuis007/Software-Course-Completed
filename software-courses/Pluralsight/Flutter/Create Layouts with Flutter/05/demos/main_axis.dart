import 'dart:math';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          title: Text('Your Title here'),
        ),
        body: Home()
        ),
    );
  }
  }

  class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size.width;
      return Container(
            width: size,
            child: Column(
            mainAxisSize: MainAxisSize.max,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: createSquares(5),),
         
      );
    }
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    String myText;
    List colors = [Colors.amber, Colors.deepPurple, Colors.deepOrange, Colors.indigo, Colors.lightBlue];
    List<Widget> buttons = List<Widget>();
    Widget button;
    while (i < numSquares) {
      myText = (pow(i,20)).toString();
      if (i==2) {
        button = Expanded(child:RaisedButton(
        color: colors[i],
        child: Text(myText),
        onPressed: () => {},
        ));}
        else {
        button = RaisedButton(
        color: colors[i],
        child: Text(myText),
        onPressed: () => {},
      );
        }
      i++;
      buttons.add(button);
      }
    return buttons;
    }
  

