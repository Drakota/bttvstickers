import 'package:flutter/material.dart';
import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/navicon.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kSmallNavBarHeight),
        child: NavBar(
          small: true,
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          leading: NavIcon(
            assetName: "assets/icons/x.svg",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
