import 'package:bttvstickers/routes.dart';
import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/themes/dark_theme.dart';
import 'package:bttvstickers/themes/light_theme.dart';
import 'package:bttvstickers/utils/create_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTTV Stickers',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        return createRoute(routes[settings.name]);
      },
    );
  }
}
