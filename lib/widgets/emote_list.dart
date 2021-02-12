import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/services/fetch_emotes.dart';
import 'package:bttvstickers/widgets/emote_tile.dart';
import 'package:flutter/material.dart';

class EmoteList extends StatefulWidget {
  EmoteList();

  @override
  _EmoteListState createState() => _EmoteListState();
}

class _EmoteListState extends State<EmoteList> {
  Future<List<Emote>> _futureEmotes;
  List<Emote> _emotes = List();
  ScrollController _scrollController = ScrollController();
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _futureEmotes = fetchEmotes(offset: _offset);
    _scrollController.addListener(() {
      // If we are at the bottom of the scroller fetch more emotes
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        setState(() {
          _futureEmotes = fetchEmotes(offset: _offset);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Emote>>(
      future: _futureEmotes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            _emotes += snapshot.data;
            _offset += kItemLimit;
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
        }

        return _createScrollView();
      },
    );
  }

  Widget _createScrollView() {
    return CustomScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(kDefaultPadding),
          sliver: SliverGrid.count(
            crossAxisCount: kEmoteListVerticalItemCount,
            crossAxisSpacing: kEmoteListSpacing,
            mainAxisSpacing: kEmoteListSpacing,
            children: _emotes.map((emote) => EmoteTile(emote: emote)).toList(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(kDefaultPadding),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
