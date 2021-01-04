import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kNavBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      elevation: kNavBarElevation,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/settings.svg",
          height: kNavBarIconHeight,
        ),
        splashRadius: kNavBarIconSplashRadius,
        onPressed: () {
          // TODO
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            height: kNavBarIconHeight,
          ),
          splashRadius: kNavBarIconSplashRadius,
          onPressed: () {
            // TODO
          },
        )
      ],
    );
  }
}
