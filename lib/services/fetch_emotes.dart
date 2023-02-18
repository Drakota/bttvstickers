import 'dart:convert';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/category.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:http/http.dart' as http;

Future<List<Emote>> fetchEmotes({
  required Category category,
  String? query,
  String? before,
  int? offset,
  int limit = kItemLimit,
}) async {
  var args = <String, String>{};
  if (offset != null) {
    args["offset"] = offset.toString();
  }
  if (before != null && query == null) {
    args["before"] = before;
  }
  if (query != null) {
    args["query"] = query;
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
      if (query == null) {
        url = kSharedEmotesUrl;
      } else {
        url = kSharedSearchEmotesUrl;
      }
      break;
    case Category.global:
      url = kGlobalEmotesUrl;
      break;
    default:
      break;
  }

  final response = await http.get(Uri.parse("$url?$queryString"));
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body) as List;
    return result.map((item) {
      // Global emotes return the emote directly so if the value in the object's
      // key emote is null we just take the whole object
      if (item['emote'] == null) {
        return Emote.fromJson(item);
      }

      var emote = item['emote'];
      // Offset doesn't work anymore for global emotes so we use the id
      emote['paginationId'] = item['id'];
      return Emote.fromJson(emote);
    }).toList();
  } else {
    throw Exception(
      'Failure while fetching emotes...\nError: ${response.body}',
    );
  }
}
