import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:bttvstickers/widgets/emote_list.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = kDefaultCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: DropdownButton<String>(
          value: category,
          underline: Container(),
          icon: SvgButtonIcon(
            assetName: "assets/icons/chevron-down.svg",
          ),
          items: Category.values.map((Category category) {
            var value = foundation.describeEnum(category);
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              category = value;
            });
          },
        ),
        centerTitle: true,
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
      body: EmoteList(
        category: category,
      ),
    );
  }
}
