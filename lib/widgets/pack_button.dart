import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);
    final sum = pack.added.length + pack.selected.length;

    return AnimatedOpacity(
      opacity: pack.selected.length > 0 ? 1.0 : 0.0,
      duration: kPackButtonFadeOutTime,
      child: pack.selected.length > 0
          // For some reasons, if we don't do this the FAB displays at the
          // bottom for a split second when changing routes, this unfortunately
          // breaks the fadeOut animation
          ? FloatingActionButton.extended(
              onPressed: () => pack.seal(),
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                Icons.save,
                color: Theme.of(context).buttonColor,
              ),
              label: Text(
                "$sum sticker${sum > 1 ? "s" : ""} selected in the pack",
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : Container(),
    );
  }
}
