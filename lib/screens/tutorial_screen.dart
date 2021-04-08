import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/navbar.dart';
import 'package:bttvstickers/widgets/svg_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:bttvstickers/widgets/card.dart' as own;

class TutorialScreen extends StatelessWidget {
  static String routeName = "/tutorial";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kSmallNavBarHeight),
        child: NavBar(
          small: true,
          centerTitle: true,
          title: Text(
            "Tutorial",
            style: Theme.of(context).textTheme.headline5,
          ),
          leading: SvgButtonIcon(
            assetName: "assets/icons/x.svg",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: <Widget>[
              own.Card(
                color: Colors.yellow.shade800,
                child: Text(
                  kTutorialWarning,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: kErrorCardTextSpacing,
              ),
              own.Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step 1: Enable the keyboard",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/activate1.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/activate2.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/activate3.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/activate4.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/activate5.png"),
                  ],
                ),
              ),
              Container(
                height: kErrorCardTextSpacing,
              ),
              own.Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step 2: Use the keyboard switch icon to use BTTV Stickers",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/usage1.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/usage2.png"),
                    Container(
                      height: kErrorCardTextSpacing,
                    ),
                    Image.asset("assets/images/usage3.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
