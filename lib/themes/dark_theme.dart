import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    textTheme: ThemeData.dark()
        .textTheme
        .copyWith(
          subtitle1: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          subtitle2: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          headline5: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
          ),
          headline6: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(
          fontFamily: 'Inter',
        ),
    // ignore: deprecated_member_use
    accentColor: const Color(0xff64ffda),
    hintColor: const Color(0xffadaaa5),
    scaffoldBackgroundColor: const Color(0xff0e0e10),
    cardColor: const Color(0xff464649),
    // ignore: deprecated_member_use
    buttonColor: const Color(0xffe5e5e5),
    secondaryHeaderColor: const Color(0xff1f1f23),
  );
}
