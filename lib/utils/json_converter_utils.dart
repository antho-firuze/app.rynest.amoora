import 'package:json_annotation/json_annotation.dart';

class StringToIntConverter implements JsonConverter<int, String?> {
  const StringToIntConverter();

  @override
  int fromJson(String? json) => json == null ? 0 : (int.tryParse(json) ?? 0);

  @override
  String? toJson(int? object) => object?.toString();
}

class IntToBoolConverter implements JsonConverter<bool, int> {
  const IntToBoolConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}
