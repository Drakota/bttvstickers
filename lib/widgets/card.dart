import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget? child;
  final void Function() onTap;
  final Color? color;
  final Border? border;
  final bool addPadding;

  Card({
    Key? key,
    this.child,
    this.color,
    this.border,
    this.addPadding = true,
    onTap,
  })  : onTap = onTap ?? (() => {}),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          border: border,
          color: color ?? Theme.of(context).secondaryHeaderColor,
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(kDefaultBorderRadius),
          ),
          child: SizedBox(
            width: double.infinity,
            child: addPadding
                ? Padding(
                    padding: const EdgeInsets.all(kDefaultPadding + 10.0),
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
