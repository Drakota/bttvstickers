import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ClearPackCard extends StatelessWidget {
  const ClearPackCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);

    return Consumer<Pack>(
      builder: (context, settings, child) => own.Card(
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/trash.svg",
              height: kNavBarIconHeight,
              // ignore: deprecated_member_use
              color: Theme.of(context).buttonColor,
            ),
            const Spacer(
              flex: kIconFieldFlexSpacing,
            ),
            Text(
              "Clear pack",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Spacer(flex: 20),
          ],
        ),
        border: Border.all(
          width: kDefaultCardBorderSize,
          color: Colors.yellow,
        ),
        onTap: () {
          pack.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Pack cleared successfully...",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              // ignore: deprecated_member_use
              backgroundColor: Theme.of(context).accentColor,
              duration: kDefaultSnackBarLifetime,
            ),
          );
        },
      ),
    );
  }
}
