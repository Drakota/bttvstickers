import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Inter',
        ),
    scaffoldBackgroundColor: Color(0xff0e0e10),
    secondaryHeaderColor: Color(0xff1f1f23),
  );
}
