import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:bttvstickers/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';

class Route {
  WidgetBuilder builder;
  TransitionSettings? transitionSettings;

  Route({required this.builder, this.transitionSettings});
}

class TransitionSettings {
  Offset startPosition;

  TransitionSettings({required this.startPosition});
}

final Map<String, Route> routes = {
  HomeScreen.routeName: Route(
    builder: (context) => const HomeScreen(),
  ),
  SearchScreen.routeName: Route(
    builder: (context) => const SearchScreen(),
  ),
  SettingsScreen.routeName: Route(
    builder: (context) => const SettingsScreen(),
    transitionSettings:
        TransitionSettings(startPosition: const Offset(0.0, 1.0)),
  ),
  TutorialScreen.routeName: Route(
    builder: (context) => const TutorialScreen(),
  ),
};
