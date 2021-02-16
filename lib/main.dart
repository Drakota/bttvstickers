import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/models/settings.dart';
import 'package:bttvstickers/routes.dart';
import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/themes/dark_theme.dart';
import 'package:bttvstickers/themes/light_theme.dart';
import 'package:bttvstickers/utils/create_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Settings()),
        ChangeNotifierProvider(create: (context) => Pack()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Settings>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      themeMode: settings.theme,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        return createRoute(routes[settings.name]);
      },
    );
  }
}
