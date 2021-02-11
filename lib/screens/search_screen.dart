import 'package:bttvstickers/widgets/clearable_textfield.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/navicon.dart';
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
        leading: NavIcon(
          assetName: "assets/icons/chevron-left.svg",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
