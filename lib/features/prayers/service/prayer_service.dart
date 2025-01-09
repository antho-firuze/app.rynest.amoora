// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_service.g.dart';

@JsonLiteral('../repository/prayers_repo.json', asConst: true)
const prayersRepo = _$prayersRepoJsonLiteral;

class PrayerService {
  Ref ref;
  PrayerService(this.ref);

  List<Map<String, Object>>? fetchPrayers() => prayersRepo;
}

final prayerServiceProvider = Provider(PrayerService.new);
