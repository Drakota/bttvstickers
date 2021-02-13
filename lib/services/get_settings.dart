import 'dart:convert';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/settings.dart';
import 'package:bttvstickers/utils/file_helpers.dart';

Future<Map<String, dynamic>> getSettings() async {
  var file = await getLocalFile(kSettingsFileName);
  Map<String, dynamic> json = jsonDecode(await file.readAsString());

  return json;
}

void saveSettings(Settings settings) async {
  var file = await getLocalFile(kSettingsFileName);
  await writeToFile(file, settings);
}
