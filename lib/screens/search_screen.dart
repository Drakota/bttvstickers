import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/widgets/clearable_textfield.dart';
import 'package:bttvstickers/widgets/emote_list.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _query = "";

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(() {
      if (_textEditingController.text.length >= 3 ||
          _textEditingController.text == "") {
        setState(() {
          _query = _textEditingController.text;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
        child: EmoteList(
          category: Category.shared.toString(),
          query: _query,
        ),
      ),
    );
  }
}
