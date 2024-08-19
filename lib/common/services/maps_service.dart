// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

part 'maps_service.g.dart';

@JsonLiteral('../repository/maps_night_mode.json', asConst: true)
const darkMapStyle = _$darkMapStyleJsonLiteral;
