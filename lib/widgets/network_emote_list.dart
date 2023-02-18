import 'dart:io';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/services/fetch_emotes.dart';
import 'package:bttvstickers/widgets/emote_tile.dart';
import 'package:bttvstickers/widgets/error_card.dart';
import 'package:bttvstickers/widgets/network_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkEmoteList extends StatefulWidget {
  final Category category;
  final String? query;

  const NetworkEmoteList({Key? key, required this.category, this.query})
      : super(key: key);

  @override
  _NetworkEmoteListState createState() => _NetworkEmoteListState();
}

class _NetworkEmoteListState extends State<NetworkEmoteList> {
  Future<List<Emote>>? _futureEmotes;
  List<Emote> _emotes = [];
  final ScrollController _scrollController = ScrollController();
  int _offset = 0;
  bool _loading = false;

  Future<List<Emote>> getEmotes() async {
    setState(() {
      _loading = true;
    });
    var before = _emotes.isNotEmpty
        ? (widget.category == Category.shared)
            ? _emotes.last.id
            : _emotes.last.paginationId
        : null;
    var query = (widget.query != null && widget.query!.length >= 3)
        ? widget.query
        : null;
    var result = await fetchEmotes(
      category: widget.category,
      query: query,
      // Pagination with offset seems to only work for
      // shared emotes with a query
      offset: query != null ? _offset : null,
      // The API for shared needs to know the last id of our
      // list of emotes to paginate
      before: before,
    );

    if (widget.category == Category.global && _emotes.isNotEmpty) {
      // The API for global always return the same data even if we have
      // an offset (no empty array), so if the category is global and we
      // already fetched something just return an empty array
      result = [];
    }
    setState(() {
      // Even when passing a limit the API return different result length
      // So we move the offset by the length of what we receive
      // to prevent from skipping some emotes
      _loading = false;
      _emotes += result;
      _offset += result.length + 1;
    });
    return _emotes;
  }

  void _scrollListener() {
    // If we are at the bottom of the scroller fetch more emotes
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      // Prvevent refetching if we are already fetching a page
      if (!_loading) {
        _futureEmotes = getEmotes();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // If we are not on the HomeScreen don't load initial emotes
    if (widget.query == null) {
      _futureEmotes = getEmotes();
    }
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void didUpdateWidget(NetworkEmoteList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category) {
      _offset = 0;
      _emotes.clear();
      _futureEmotes = getEmotes();
    } else if (widget.query != oldWidget.query) {
      _offset = 0;
      _emotes.clear();
      if (widget.query != "") {
        _futureEmotes = getEmotes();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pack = Provider.of<Pack>(context);

    return FutureBuilder<List<Emote>>(
      future: _futureEmotes,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Widget card = ErrorCard(
            error: snapshot.error.toString(),
          );
          // Device not connected to the internet
          if (snapshot.error is SocketException) {
            card = NetworkCard(
              onRefreshPressed: () => _futureEmotes = getEmotes(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: card,
          );
        }
        return OrientationBuilder(
          builder: (context, orientation) => CustomScrollView(
            controller: _scrollController,
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
                      emote: _emotes[index],
                      selected: pack.isEmoteSelected(_emotes[index]),
                      added: pack.isEmoteAdded(_emotes[index]),
                      onTap: () => pack.toggleSelection(_emotes[index]),
                    ),
                    childCount: _emotes.length,
                  ),
                ),
              ),
              if (_loading)
                const SliverPadding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
