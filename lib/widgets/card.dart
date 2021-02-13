import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  Card({this.child, Function() onTap}) : onTap = onTap ?? (() => {});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding + 10.0),
              child: child,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
