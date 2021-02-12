import 'dart:convert';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:http/http.dart' as http;

Future<List<Emote>> fetchEmotes({
  int offset = 0,
  int limit = kItemLimit,
}) async {
  final response = await http.get(
    '$kTopSharedEmotesUrl?offset=$offset&limit=$limit',
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body) as List;
    return result.map((item) => Emote.fromJson(item['emote'])).toList();
  } else {
    throw Exception('Failed to load emotes...');
  }
}
