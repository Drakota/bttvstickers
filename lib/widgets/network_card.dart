import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkCard extends StatelessWidget {
  final void Function() onRefreshPressed;

  NetworkCard({Function() onRefreshPressed})
      : onRefreshPressed = onRefreshPressed ?? (() => {});

  @override
  Widget build(BuildContext context) {
    return own.Card(
      border: Border.all(
        width: kErrorCardBorderSize,
        color: Colors.yellow,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/broadcast.svg",
            color: Theme.of(context).buttonColor,
            width: kNetworkCardImageWidth,
          ),
          Text(
            "No Internet connection",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: kErrorCardTextSpacing),
          Text(
            "Check your connection, then refresh the list.",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kErrorCardTextSpacing),
          RaisedButton(
            child: Text(
              "Refresh",
              style: Theme.of(context).textTheme.headline6,
            ),
            color: Theme.of(context).accentColor,
            onPressed: onRefreshPressed,
          ),
        ],
      ),
    );
  }
}
