import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/services/fetch_emotes.dart';
import 'package:bttvstickers/utils/enum_from_string.dart';
import 'package:bttvstickers/widgets/emote_tile.dart';
import 'package:flutter/material.dart';

class EmoteList extends StatefulWidget {
  Category category;

  EmoteList({String category}) {
    this.category = enumFromString(Category.values, category);
  }

  @override
  _EmoteListState createState() => _EmoteListState();
}

class _EmoteListState extends State<EmoteList> {
  Future<List<Emote>> _futureEmotes;
  List<Emote> _emotes = List();
  ScrollController _scrollController = ScrollController();
  int _offset = 0;

  void getEmotes() {
    if (widget.category == Category.shared) {
      _futureEmotes = fetchEmotes(
        category: widget.category,
        before: _emotes.length > 0 ? _emotes.last.id : null,
      );
      return;
    }
    _futureEmotes = fetchEmotes(
      category: widget.category,
      offset: _offset,
    );
  }

  @override
  void initState() {
    super.initState();
    getEmotes();
    _scrollController.addListener(() {
      // If we are at the bottom of the scroller fetch more emotes
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        if (_emotes.length > 0 && widget.category == Category.global) {
          return;
        }
        setState(() {
          getEmotes();
        });
      }
    });
  }

  @override
  void didUpdateWidget(EmoteList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category) {
      _offset = 0;
      _emotes.clear();
      getEmotes();
    }
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
        if (widget.category != Category.global)
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
