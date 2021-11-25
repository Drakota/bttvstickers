import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/screens/tutorial_screen.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return own.Card(
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/question.svg",
            height: kNavBarIconHeight,
            // ignore: deprecated_member_use
            color: Theme.of(context).buttonColor,
          ),
          const Spacer(
            flex: kIconFieldFlexSpacing,
          ),
          Text(
            "Tutorial",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(flex: 20),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, TutorialScreen.routeName);
      },
    );
  }
}
