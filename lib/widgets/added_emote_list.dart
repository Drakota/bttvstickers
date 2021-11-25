import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/widgets/emote_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddedEmoteList extends StatefulWidget {
  const AddedEmoteList({Key? key}) : super(key: key);

  @override
  _AddedEmoteListState createState() => _AddedEmoteListState();
}

class _AddedEmoteListState extends State<AddedEmoteList> {
  List<Emote> _addedEmotes = [];

  @override
  void initState() {
    super.initState();
    _addedEmotes = context.read<Pack>().added.toList();
  }

  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);

    return OrientationBuilder(
      builder: (context, orientation) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(kDefaultPadding),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait
                    ? kEmoteListVerticalItemCount
                    : kEmoteListHorizontalItemCount,
                crossAxisSpacing: kEmoteListSpacing,
                mainAxisSpacing: kEmoteListSpacing,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => EmoteTile(
                  emote: _addedEmotes[index],
                  selected: pack.isEmoteSelected(_addedEmotes[index]),
                  added: pack.isEmoteAdded(_addedEmotes[index]),
                  onTap: () => pack.toggleSelection(_addedEmotes[index]),
                ),
                childCount: _addedEmotes.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
