// @dart=2.9
import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/models/settings.dart';
import 'package:bttvstickers/routes.dart';
import 'package:bttvstickers/screens/home_screen.dart';
import 'package:bttvstickers/themes/dark_theme.dart';
import 'package:bttvstickers/themes/light_theme.dart';
import 'package:bttvstickers/utils/create_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    FirebaseAnalytics analytics = FirebaseAnalytics();
    final settings = Provider.of<Settings>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      themeMode: settings.theme,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        var route = routes[settings.name];
        if (route == null) {
          throw Exception("Route is not defined in routes file...");
        }
        return createRoute(route);
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
