import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';

class EmoteTile extends StatelessWidget {
  final Emote emote;

  EmoteTile({
    @required this.emote,
  });

  @override
  Widget build(BuildContext context) {
    return own.Card(
      color: Theme.of(context).cardColor,
      addPadding: false,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '$kEmoteCdnUrl/${emote.imagePath}',
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

  SizedBox newMethod(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(kDefaultBorderRadius),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  '$kEmoteCdnUrl/${emote.imagePath}',
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
      ),
    );
  }
}
