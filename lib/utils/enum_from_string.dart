import 'package:bttvstickers/extensions/first_where_or_null.dart';

T? enumFromString<T>(List<T> values, String value) {
  return values.firstWhereOrNull((v) => v.toString() == value);
}
