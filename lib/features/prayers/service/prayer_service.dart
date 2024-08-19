// ignore_for_file: invalid_annotation_target

import 'package:amoora/features/prayers/model/prayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_service.g.dart';

@JsonLiteral('../repository/prayers_repo.json', asConst: true)
const prayersRepo = _$prayersRepoJsonLiteral;

final prayerServiceProvider = Provider(PrayerService.new);

class PrayerService {
  final Ref ref;

  PrayerService(this.ref);

  List<Prayer> getPrayers() {
    var data = Prayers.fromJson(prayersRepo);
    return data.prayers;
  }
}
