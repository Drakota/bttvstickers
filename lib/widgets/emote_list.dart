import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/services/fetch_emotes.dart';
import 'package:bttvstickers/utils/enum_from_string.dart';
import 'package:bttvstickers/widgets/emote_tile.dart';
import 'package:flutter/material.dart';

class EmoteList extends StatefulWidget {
  final Category category;

  EmoteList({String category})
      : category = enumFromString(Category.values, category);

  @override
  _EmoteListState createState() => _EmoteListState();
}

class _EmoteListState extends State<EmoteList> {
  Future<List<Emote>> _futureEmotes;
  List<Emote> _emotes = List();
  ScrollController _scrollController = ScrollController();
  int _offset = 0;
  bool _hasMoreData = true;

  Future<List<Emote>> getEmotes() async {
    var before = (widget.category == Category.shared && _emotes.isNotEmpty)
        ? _emotes.last.id
        : null;
    var result = await fetchEmotes(
      category: widget.category,
      offset: _offset,
      // The API for shared needs to know the last id of our
      // list of emotes to paginate
      before: before,
    );

    if (widget.category == Category.global && _emotes.length > 0) {
      // The API for global always return the same data even if we have
      // an offset (no empty array), so if the category is global and we
      // already fetched something just return an empty array
      result = [];
    }
    setState(() {
      // Even when passing a limit the API return different result length
      // So we move the offset by the length of what we receive
      // to prevent from skipping some emotes
      _emotes += result;
      _offset += result.length + 1;
      _hasMoreData = result.length > 0;
    });
    return _emotes;
  }

  void _scrollListener() {
    // If we are at the bottom of the scroller fetch more emotes
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      _futureEmotes = getEmotes();
    }
  }

  @override
  void initState() {
    super.initState();
    _futureEmotes = getEmotes();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void didUpdateWidget(EmoteList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category) {
      _offset = 0;
      _emotes.clear();
      _futureEmotes = getEmotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Emote>>(
      future: _futureEmotes,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
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
        if (_hasMoreData)
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
