import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/emote.dart';
import 'package:bttvstickers/models/json_serializable.dart';
import 'package:bttvstickers/utils/file_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pack extends ChangeNotifier implements JsonSerializable {
  List<String> _added = [];
  List<String> _selected = [];
  String _fileName = kPackFileName;
  MethodChannel _platform = const MethodChannel(kStickerIndexingChannel);

  Pack() {
    fromJson(getJsonFromFile(_fileName));
  }

  List<String> get selected => _selected;
  List<String> get added => _added;

  toggleSelection(Emote emote) {
    if (_added.contains(emote.id)) {
      _added.removeWhere((emoteId) => emoteId == emote.id);
      _selected += _added;
      _added.clear();
    } else if (!_selected.contains(emote.id)) {
      _selected.add(emote.id);
    } else {
      _selected.removeWhere((emoteId) => emoteId == emote.id);
    }
    notifyListeners();
  }

  seal() {
    _added += _selected;
    _selected.clear();
    saveModelToJsonFile(this, _fileName);
    _platform.invokeMethod(
      "generatePack",
      _added,
    );
    notifyListeners();
  }

  clear() {
    _selected.clear();
    _added.clear();
    saveModelToJsonFile(this, _fileName);
    _platform.invokeMethod("generatePack", []);
    notifyListeners();
  }

  fromJson(Future<Map<String, dynamic>> futureJson) async {
    var json = await futureJson;
    _added = (json['added'] ?? []).cast<String>();
    notifyListeners();
  }

  toJson() {
    return {
      'added': _added,
    };
  }
}
