import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/screens/tutorial_screen.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorialCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return own.Card(
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/question.svg",
            height: kNavBarIconHeight,
            color: Theme.of(context).buttonColor,
          ),
          Spacer(
            flex: kIconFieldFlexSpacing,
          ),
          Text(
            "Tutorial",
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(flex: 20),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, TutorialScreen.routeName);
      },
    );
  }
}
