import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/options_card.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:bttvstickers/widgets/versioning_card.dart';
import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.headline5,
          ),
          leading: SvgButtonIcon(
            assetName: "assets/icons/x.svg",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: <Widget>[
              OptionsCard(
                fieldName: "Theme",
                options: [
                  Option(
                    assetName: "assets/icons/sun.svg",
                    value: "light",
                    displayName: "Light",
                  ),
                  Option(
                    assetName: "assets/icons/moon.svg",
                    value: "dark",
                    displayName: "Dark",
                  ),
                  Option(
                    assetName: "assets/icons/light-bulb.svg",
                    value: "automatic",
                    displayName: "Automatic",
                  ),
                ],
                // onChange: (selectedOption) => print(selectedOption.value),
              ),
              Spacer(),
              VersioningCard(),
            ],
          ),
        ),
      ),
    );
  }
}
