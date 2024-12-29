// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_service.g.dart';

@JsonLiteral('../repository/quran_complete.json', asConst: true)
const quranRepo = _$quranRepoJsonLiteral;

@JsonLiteral('../repository/juzs.json', asConst: true)
const juzsRepo = _$juzsRepoJsonLiteral;

class QuranService {
  Ref ref;
  QuranService(this.ref);

  List<Map<String, Object>>? fetchQuran() => quranRepo;

  List<Map<String, Object>>? fetchJuzs() => juzsRepo['juzs'];
}

final quranServiceProvider = Provider(QuranService.new);
