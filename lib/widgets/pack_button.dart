import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackButton extends StatelessWidget {
  const PackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);
    final sum = pack.added.length + pack.selected.length;

    return AnimatedOpacity(
      opacity: pack.selected.isNotEmpty ? 1.0 : 0.0,
      duration: kPackButtonFadeOutTime,
      child: pack.selected.isNotEmpty
          // For some reasons, if we don't do this the FAB displays at the
          // bottom for a split second when changing routes, this unfortunately
          // breaks the fadeOut animation
          ? FloatingActionButton.extended(
              onPressed: () => pack.seal(),
              // ignore: deprecated_member_use
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                Icons.save,
                // ignore: deprecated_member_use
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
