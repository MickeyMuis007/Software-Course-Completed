import 'package:flutter/material.dart';
import 'package:hero_demo/radial.dart';


enum Drinks {
  coffee,
  cappuccino,
  tea
}

class Util {
  
static const String COFFEE_URL='http://bit.ly/fl_coffee';
static const String CAPPUCCINO_URL='http://bit.ly/fl_cappuccino';
static const String TEA_URL='http://bit.ly/fl_tea';
  
  static Widget buildHeroIcon(String path, String tag) {
    return Hero(
      tag: tag,
      child: RadialTransition(
        maxRadius: 80,
        child: Container(
        // width: 100,
        // height: 80,
        child:Image.network(path,  
          fit: BoxFit.cover,)
        )
      ,
    ));
  }

  static Widget buildHeroRadialIcon(String path, String tag, double minRadius, double maxRadius) {
    return Container(
      child: Hero(
      createRectTween: _createRectTween,
      tag: tag,
      child: Container(
        height: minRadius,
        width:  minRadius,
        child: RadialTransition(
        maxRadius: maxRadius,
        child:Image.network(path,  
          fit: BoxFit.cover,)
        )
      ,
    )));
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget buildHeroDestination(String path, String tag, double width) {
    return Hero(
      tag: tag,
      child: Container(
        width: width,
        child:Image.network(path,  
          fit: BoxFit.cover,)
        )
      ,
    );
  }
  static Widget buildHeroRadialDestination(String path, String tag, 
    double maxWidth, double maxHeight, VoidCallback pop) {
    return GestureDetector(
      child: Hero(
        createRectTween: _createRectTween,
        tag: tag,
        child: Container(
        height: maxHeight,
        width: maxWidth,
        child: RadialTransition(
          maxRadius: maxWidth/2,
          child:Image.network(path,  
            fit: BoxFit.cover,)
          )
        ,
      )),
      onTap: pop,
      );
  }
}