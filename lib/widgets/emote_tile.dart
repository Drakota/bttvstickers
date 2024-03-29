import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EmoteTile extends StatelessWidget {
  final Emote emote;
  final bool selected;
  final bool added;
  final void Function() onTap;

  EmoteTile({
    Key? key,
    required this.emote,
    this.selected = false,
    this.added = false,
    onTap,
  })  : onTap = onTap ?? (() => {}),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = added
        // ignore: deprecated_member_use
        ? Theme.of(context).accentColor
        : selected
            ? Theme.of(context).hintColor
            : Theme.of(context).cardColor;

    return own.Card(
      color: bgColor,
      addPadding: false,
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage.memoryNetwork(
                fadeInDuration: kEmoteTileFadeInTime,
                image: emote.imageUrl,
                placeholder: kTransparentImage,
                height: kEmoteTileImageHeight,
                width: kEmoteTileImageWidth,
              ),
              const SizedBox(
                height: kEmoteTileImageSubtitleSpacing,
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  emote.code,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
