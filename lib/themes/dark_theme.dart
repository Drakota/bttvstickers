import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    textTheme: ThemeData.dark()
        .textTheme
        .copyWith(
          subtitle1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          subtitle2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          headline5: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
          ),
          headline6: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(
          fontFamily: 'Inter',
        ),
    accentColor: Color(0xff64ffda),
    scaffoldBackgroundColor: Color(0xff0e0e10),
    cardColor: Color(0xff464649),
    buttonColor: Color(0xffe5e5e5),
    secondaryHeaderColor: Color(0xff1f1f23),
  );
}
