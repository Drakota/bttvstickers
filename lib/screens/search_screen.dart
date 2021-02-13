import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/clearable_textfield.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        small: true,
        title: ClearableTextField(
          controller: _textEditingController,
          autofocus: true,
          hintText: "Search...",
        ),
        leading: SvgButtonIcon(
          assetName: "assets/icons/chevron-left.svg",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: <Widget>[
            Text(
              'Search',
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
