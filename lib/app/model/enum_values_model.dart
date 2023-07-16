class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    return reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}
