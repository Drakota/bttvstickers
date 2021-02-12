import 'dart:convert';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:http/http.dart' as http;

Future<List<Emote>> fetchEmotes({
  Category category,
  String before,
  int offset,
  int limit = kItemLimit,
}) async {
  var args = <String, String>{};
  if (offset != null) {
    args["offset"] = offset.toString();
  }
  if (before != null) {
    args["before"] = before;
  }
  args["limit"] = limit.toString();

  String url = "";
  String queryString = Uri(queryParameters: args).query;
  switch (category) {
    case Category.top:
      url = kTopEmotesUrl;
      break;
    case Category.trending:
      url = kTrendingEmotesUrl;
      break;
    case Category.shared:
      url = kSharedEmotesUrl;
      break;
    case Category.global:
      url = kGlobalEmotesUrl;
      break;
  }

  final response = await http.get("$url?$queryString");
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body) as List;
    // Global emotes return the emote directly so if the value in the object's
    // key emote is null we just take the whole object
    return result.map((item) => Emote.fromJson(item['emote'] ?? item)).toList();
  } else {
    throw Exception('Failed to load emotes...');
  }
}
