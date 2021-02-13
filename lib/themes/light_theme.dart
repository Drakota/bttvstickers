import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData.light().copyWith(
    textTheme: ThemeData.light()
        .textTheme
        .copyWith(
          subtitle1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        )
        .apply(
          fontFamily: 'Inter',
        ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xffe5e5e5),
    buttonColor: Color(0xff464649),
    secondaryHeaderColor: Color(0xffefeff1),
  );
}
