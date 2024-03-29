import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/widgets/clearable_textfield.dart';
import 'package:bttvstickers/widgets/network_emote_list.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/pack_button.dart';
import 'package:bttvstickers/widgets/svg_button_icon.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  void onSearchChanged(String value) {
    if (value.length >= 3 || value == "") {
      setState(() {
        _query = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: NavBar(
        small: true,
        title: ClearableTextField(
          hintText: "Search...",
          onChanged: onSearchChanged,
          debounceTime: kDefaultDebounceTime,
          autofocus: true,
        ),
        leading: SvgButtonIcon(
          assetName: "assets/icons/chevron-left.svg",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: NetworkEmoteList(
          category: Category.shared,
          query: _query,
        ),
      ),
    );
  }
}
