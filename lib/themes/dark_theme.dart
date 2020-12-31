import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Inter',
        ),
  );
}
