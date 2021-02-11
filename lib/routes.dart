import 'package:flutter/material.dart';
import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen()
};
