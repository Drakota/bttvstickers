import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorCard extends StatelessWidget {
  final String error;

  ErrorCard({this.error = ""});

  @override
  Widget build(BuildContext context) {
    return own.Card(
      border: Border.all(
        width: kDefaultCardBorderSize,
        color: Colors.red,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/sadge.svg",
            color: Theme.of(context).buttonColor,
            width: kErrorCardImageWidth,
          ),
          Text(
            "An error has occured!",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: kErrorCardTextSpacing),
          Text(
            "Send this to the developer",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: kErrorCardTextSpacing),
          Text(
            "$error",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontFamily: 'CascadiaMono',
            ),
          )
        ],
      ),
    );
  }
}
