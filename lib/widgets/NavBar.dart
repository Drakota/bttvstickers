import 'package:flutter/material.dart';
import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/screens/search_screen.dart';
import 'package:bttvstickers/screens/settings_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kNavBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      elevation: kNavBarElevation,
      brightness: Theme.of(context).brightness,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/settings.svg",
          height: kNavBarIconHeight,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        splashRadius: kNavBarIconSplashRadius,
        onPressed: () {
          Navigator.pushNamed(context, SettingsScreen.routeName);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            height: kNavBarIconHeight,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          splashRadius: kNavBarIconSplashRadius,
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        )
      ],
    );
  }
}
