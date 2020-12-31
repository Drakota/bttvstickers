import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Inter',
        ),
  );
}
