import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/extensions/first_where_or_null.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/models/json_serializable.dart';
import 'package:bttvstickers/utils/file_helpers.dart';
import 'package:flutter/material.dart';

class Pack extends ChangeNotifier implements JsonSerializable {
  List<Emote> _added = [];
  List<Emote> _selected = [];
  String _fileName = kPackFileName;

  Pack() {
    fromJson(getJsonFromFile(_fileName));
  }

  List<Emote> get selected => _selected;
  List<Emote> get added => _added;

  toggleSelection(Emote emote) {
    if (isEmoteAdded(emote)) {
      _added.removeWhere((e) => e.id == emote.id);
      _selected += _added;
      _added.clear();
    } else if (!isEmoteSelected(emote)) {
      _selected.add(emote);
    } else {
      _selected.removeWhere((e) => e.id == emote.id);
    }
    notifyListeners();
  }

  seal() {
    _added += _selected;
    _selected.clear();
    saveModelToJsonFile(this, _fileName);
    notifyListeners();
  }

  clear() {
    _selected.clear();
    _added.clear();
    saveModelToJsonFile(this, _fileName);
    notifyListeners();
  }

  isEmoteAdded(Emote emote) {
    return _added.firstWhereOrNull((e) => e.id == emote.id) != null;
  }

  isEmoteSelected(Emote emote) {
    return _selected.firstWhereOrNull((e) => e.id == emote.id) != null;
  }

  fromJson(Future<Map<String, dynamic>> futureJson) async {
    var json = await futureJson;
    _added = ((json['emotes'] ?? []) as List)
        .map((item) => Emote.fromJson(item))
        .toList();
    notifyListeners();
  }

  toJson() {
    return {
      'emotes': _added.map((e) => e.toJson()).toList(),
    };
  }
}
