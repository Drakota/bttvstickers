import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color color;
  final Border border;
  final bool addPadding;

  Card({
    this.child,
    this.color,
    this.border,
    this.addPadding = true,
    Function() onTap,
  }) : onTap = onTap ?? (() => {});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          border: this.border,
          color: color ?? Theme.of(context).secondaryHeaderColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          child: Container(
            width: double.infinity,
            child: this.addPadding
                ? Padding(
                    padding: EdgeInsets.all(kDefaultPadding + 10.0),
                    child: child,
                  )
                : child,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
