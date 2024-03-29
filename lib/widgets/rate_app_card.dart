import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';

class RateAppCard extends StatelessWidget {
  const RateAppCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InAppReview inAppReview = InAppReview.instance;

    return own.Card(
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/star.svg",
            height: kNavBarIconHeight,
            // ignore: deprecated_member_use
            color: Theme.of(context).buttonColor,
          ),
          const Spacer(
            flex: kIconFieldFlexSpacing,
          ),
          Text(
            "Rate this app",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(flex: 20),
        ],
      ),
      onTap: () {
        inAppReview.openStoreListing();
      },
    );
  }
}
