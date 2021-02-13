T enumFromString<T>(List<T> values, String value) {
  return values.firstWhere((v) => v.toString() == value, orElse: () => null);
}
