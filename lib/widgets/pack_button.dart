import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);
    return AnimatedOpacity(
      opacity: pack.selected.length > 0 ? 1.0 : 0.0,
      duration: kPackButtonFadeOutTime,
      child: pack.selected.length > 0
          // For some reasons, if we don't do this the FAB displays at the
          // bottom for a split second when changing routes, this unfortunately
          // breaks the fadeOut animation
          ? FloatingActionButton.extended(
              onPressed: () => pack.addToPack(),
              icon: Icon(Icons.save),
              label: Text(
                "${pack.added.length + pack.selected.length} stickers selected in the pack",
              ),
            )
          : Container(),
    );
  }
}
