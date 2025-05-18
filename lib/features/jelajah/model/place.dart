// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
abstract class Place with _$Place {
  factory Place({
    String? id,
    String? name,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
    String? image,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@freezed
abstract class Places with _$Places {
  factory Places({
    @JsonKey(name: "data") List<Place>? places,
  }) = _Places;

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);
}