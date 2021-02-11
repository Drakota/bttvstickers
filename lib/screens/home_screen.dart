import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/navicon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        leading: NavIcon(
          assetName: "assets/icons/settings.svg",
          onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
        ),
        actions: [
          NavIcon(
            assetName: "assets/icons/search.svg",
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'BTTV Stickers',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
