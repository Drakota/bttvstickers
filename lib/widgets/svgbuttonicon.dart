import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButtonIcon extends StatelessWidget {
  final String assetName;
  final void Function() onPressed;

  SvgButtonIcon({this.assetName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset(
        this.assetName,
        height: kNavBarIconHeight,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
      ),
      splashRadius: kNavBarIconSplashRadius,
      onPressed: this.onPressed,
    );
  }
}
