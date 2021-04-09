import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/json_serializable.dart';
import 'package:bttvstickers/utils/enum_from_string.dart';
import 'package:bttvstickers/utils/file_helpers.dart';
import 'package:flutter/material.dart';

class Settings extends ChangeNotifier implements JsonSerializable {
  ThemeMode _theme = ThemeMode.system;
  String _fileName = kSettingsFileName;

  Settings() {
    fromJson(getJsonFromFile(_fileName));
  }

  ThemeMode get theme => _theme;
  set theme(ThemeMode theme) {
    _theme = theme;
    saveModelToJsonFile(this, _fileName);
    notifyListeners();
  }

  fromJson(Future<Map<String, dynamic>> futureJson) async {
    var json = await futureJson;
    String? theme = json['theme'];
    if (theme != null) {
      _theme = enumFromString(ThemeMode.values, theme) ?? ThemeMode.system;
    }
    notifyListeners();
  }

  toJson() {
    return {
      'theme': _theme.toString(),
    };
  }
}
