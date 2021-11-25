import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkCard extends StatelessWidget {
  final void Function() onRefreshPressed;

  NetworkCard({Key? key, onRefreshPressed})
      : onRefreshPressed = onRefreshPressed ?? (() => {}),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return own.Card(
      border: Border.all(
        width: kDefaultCardBorderSize,
        color: Colors.yellow,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/broadcast.svg",
            // ignore: deprecated_member_use
            color: Theme.of(context).buttonColor,
            width: kNetworkCardImageWidth,
          ),
          Text(
            "No Internet connection",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: kErrorCardTextSpacing),
          Text(
            "Check your connection, then refresh the list.",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kErrorCardTextSpacing),
          ElevatedButton(
            child: Text(
              "Refresh",
              style: Theme.of(context).textTheme.headline6,
            ),
            style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              primary: Theme.of(context).accentColor,
            ),
            onPressed: onRefreshPressed,
          ),
        ],
      ),
    );
  }
}
