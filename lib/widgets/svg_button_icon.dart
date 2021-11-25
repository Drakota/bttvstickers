import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButtonIcon extends StatelessWidget {
  final String assetName;
  final void Function()? onPressed;

  const SvgButtonIcon({Key? key, required this.assetName, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset(
        assetName,
        height: kNavBarIconHeight,
        // ignore: deprecated_member_use
        color: Theme.of(context).buttonColor,
      ),
      splashRadius: kNavBarIconSplashRadius,
      onPressed: onPressed,
    );
  }
}
