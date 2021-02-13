import 'dart:convert';
import 'dart:io';

import 'package:bttvstickers/models/json_serializable.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> getLocalFile(String fileName) async {
  final path = await _localPath;
  var file = File('$path/$fileName.json');

  // If the file doesn't exists, create an empty json file
  if (!await file.exists()) {
    await file.create();
    await file.writeAsString(jsonEncode({}));
  }
  return file;
}

Future<File> writeToFile(File file, JsonSerializable data) async {
  return file.writeAsString(jsonEncode(data));
}
