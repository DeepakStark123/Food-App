import 'package:flutter/material.dart';

class AppColors {
  static const Color kblackColor = Colors.black;
 static const Color kwhiteColor = Color(0xffffffff);

 static const Color kbuttonColor = Colors.green;
 static const Color kscaffoldBackgroundLight = Color(0xffE0E0E0);
 static const Color kscaffoldBackgroundDark = Colors.black;
 static const Color kappBarColorlight = Color.fromARGB(255, 8, 241, 171);
 static const Color kappBarColordark = Color(0xff383434);
 static const Color kPrimarydark = Color(0xff383434);

 static MaterialColor kPrimarySwatch = MaterialColor(const Color.fromRGBO(233, 238, 238, 1).value,const <int, Color>{
      50: Color.fromRGBO(233, 238, 238, 0.1),
      100: Color.fromRGBO(233, 238, 238, 0.2),
      200: Color.fromRGBO(233, 238, 238, 0.3),
      300: Color.fromRGBO(233, 238, 238, 0.4),
      400: Color.fromRGBO(233, 238, 238, 0.5), 
      500: Color.fromRGBO(233, 238, 238, 0.6),
      600: Color.fromRGBO(233, 238, 238, 0.7),
      700: Color.fromRGBO(233, 238, 238, 0.8),
      800: Color.fromRGBO(233, 238, 238, 0.9),
      900: Color.fromRGBO(233, 238, 238, 1),
    },
  ); 

}