import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:bttvstickers/widgets/emote_list.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        leading: SvgButtonIcon(
          assetName: "assets/icons/settings.svg",
          onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
        ),
        actions: [
          SvgButtonIcon(
            assetName: "assets/icons/search.svg",
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          )
        ],
      ),
      body: EmoteList(),
    );
  }
}
