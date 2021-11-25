import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData.light().copyWith(
    textTheme: ThemeData.light()
        .textTheme
        .copyWith(
          subtitle1: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          subtitle2: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          headline5: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          headline6: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
        .apply(
          fontFamily: 'Inter',
        ),
    // ignore: deprecated_member_use
    accentColor: const Color(0xff4fdde8),
    hintColor: const Color(0xffcbcbd0),
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(0xffe5e5e5),
    // ignore: deprecated_member_use
    buttonColor: const Color(0xff464649),
    secondaryHeaderColor: const Color(0xffefeff1),
  );
}
