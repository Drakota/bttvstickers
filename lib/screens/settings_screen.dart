import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/settings.dart';
import 'package:bttvstickers/widgets/clear_pack_card.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/options_card.dart';
import 'package:bttvstickers/widgets/rate_app_card.dart';
import 'package:bttvstickers/widgets/svg_button_icon.dart';
import 'package:bttvstickers/widgets/tutorial_card.dart';
import 'package:bttvstickers/widgets/versioning_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  Widget generateSettingOptions(Orientation orientation) {
    var options = Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: <Widget>[
          Consumer<Settings>(
            builder: (context, settings, child) => OptionsCard(
              fieldName: "Theme",
              defaultValue: settings.theme,
              options: [
                Option(
                  assetName: "assets/icons/sun.svg",
                  value: ThemeMode.light,
                  displayName: "Light",
                ),
                Option(
                  assetName: "assets/icons/moon.svg",
                  value: ThemeMode.dark,
                  displayName: "Dark",
                ),
                Option(
                  assetName: "assets/icons/light-bulb.svg",
                  value: ThemeMode.system,
                  displayName: "System",
                ),
              ],
              onChange: (selectedOption) =>
                  settings.theme = selectedOption.value,
            ),
          ),
          Container(
            height: kErrorCardTextSpacing,
          ),
          ClearPackCard(),
          if (orientation == Orientation.portrait) Spacer(),
          Container(
            height: kErrorCardTextSpacing,
          ),
          TutorialCard(),
          Container(
            height: kErrorCardTextSpacing,
          ),
          RateAppCard(),
          Container(
            height: kErrorCardTextSpacing,
          ),
          VersioningCard(),
        ],
      ),
    );

    return orientation == Orientation.portrait
        ? options
        : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: options,
          );
  }

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
      body: OrientationBuilder(
        builder: (context, orientation) => generateSettingOptions(orientation),
      ),
    );
  }
}
