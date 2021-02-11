import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class Route {
  WidgetBuilder builder;
  TransitionSettings transitionSettings;

  Route({this.builder, this.transitionSettings});
}

class TransitionSettings {
  Offset startPosition;

  TransitionSettings({this.startPosition});
}

final Map<String, Route> routes = {
  HomeScreen.routeName: Route(
    builder: (context) => HomeScreen(),
  ),
  SearchScreen.routeName: Route(
    builder: (context) => SearchScreen(),
    transitionSettings: TransitionSettings(startPosition: Offset(0.0, 0.0)),
  ),
  SettingsScreen.routeName: Route(
    builder: (context) => SettingsScreen(),
    transitionSettings: TransitionSettings(startPosition: Offset(0.0, 1.0)),
  )
};
