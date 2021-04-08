import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:bttvstickers/utils/enum_from_string.dart';
import 'package:bttvstickers/widgets/added_emote_list.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/network_emote_list.dart';
import 'package:bttvstickers/widgets/pack_button.dart';
import 'package:bttvstickers/widgets/svg_button_icon.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category category = Category.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: NavBar(
        title: DropdownButton<String>(
          value: category.toString(),
          underline: Container(),
          icon: SvgButtonIcon(
            assetName: "assets/icons/chevron-down.svg",
          ),
          items: Category.values.map((Category category) {
            return DropdownMenuItem<String>(
              value: category.toString(),
              child: Text(
                foundation.describeEnum(category),
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                category =
                    enumFromString(Category.values, value) ?? Category.top;
              });
            }
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
      body: category != Category.added
          ? NetworkEmoteList(
              category: category,
            )
          : AddedEmoteList(),
    );
  }
}
