import 'package:bttvstickers/models/json_serializable.dart';
import 'package:bttvstickers/services/get_settings.dart';
import 'package:bttvstickers/utils/enum_from_string.dart';
import 'package:flutter/material.dart';

class Settings extends ChangeNotifier implements JsonSerializable {
  ThemeMode _theme;

  Settings() {
    fromJson(getSettings());
  }

  get theme => _theme;
  set theme(ThemeMode theme) {
    _theme = theme;
    saveSettings(this);
    notifyListeners();
  }

  fromJson(Future<Map<String, dynamic>> futureJson) async {
    var json = await futureJson;
    _theme =
        enumFromString(ThemeMode.values, json['theme']) ?? ThemeMode.system;
    notifyListeners();
  }

  toJson() {
    return {
      'theme': _theme.toString(),
    };
  }
}
