import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class EmoteTile extends StatelessWidget {
  final Emote emote;
  final bool selected;
  final bool added;

  EmoteTile({
    @required this.emote,
    this.selected = false,
    this.added = false,
  });

  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context, listen: false);
    Color bgColor = this.added
        ? Theme.of(context).accentColor
        : this.selected
            ? Theme.of(context).hintColor
            : Theme.of(context).cardColor;

    return own.Card(
      color: bgColor,
      addPadding: false,
      onTap: () => pack.toggleSelection(emote),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage.memoryNetwork(
                fadeInDuration: kEmoteTileFadeInTime,
                image: emote.imageUrl,
                placeholder: kTransparentImage,
                height: kEmoteTileImageHeight,
              ),
              SizedBox(
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
