import 'package:flutter/material.dart';

var sunnyColor1 =  const Color(0xFFF3C722);
var sunnyColor2 = const Color(0xFFF4EA8A);
var rainyColor1 = const Color(0xFF0A3899);
var rainyColor2 = const Color(0xFF0D207E);
var cloudyColor1 = const Color(0xFF3F4C8C);
var cloudyColor2 = const Color(0xFF59618C);
var snowyColor1 = const Color(0xFF1777BE);
var snowyColor2 = const Color(0xFF066FBD);


 MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }