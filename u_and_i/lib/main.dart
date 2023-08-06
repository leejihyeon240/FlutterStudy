import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          headline2: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50.0,
              fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 30.0,
          ),
          bodyText2:TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 20.0,
          ),
        ),
        ),
      home: HomeScreen(),
    ),
  );
}
