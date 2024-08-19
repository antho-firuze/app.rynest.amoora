// ignore_for_file: invalid_annotation_target

import 'package:amoora/env/env.dart';
import 'package:amoora/features/jelajah/model/place.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jelajah_service.g.dart';

@JsonLiteral('../repository/places_repo.json', asConst: true)
const placesRepo = _$placesRepoJsonLiteral;

final getImageJelajahProvider = FutureProvider.family<String, String>(
    (ref, filename) async => await ref.read(jelajahServiceProvider).downloadAndSafeByFilename(filename));

class JelajahService {
  final Ref ref;
  JelajahService(this.ref);

  static String baseUrl = Env.jelajahRepoUrl;
  static const dirpath = 'assets/amoora/jelajah';

  Future<List<Place>> getPlaces() async {
    if (placesRepo.isEmpty) {
      return [];
    } else {
      return placesRepo.map(Place.fromJson).toList();
    }
  }

  Future<String> downloadAndSafeByFilename(String filename) async {
    var url = '$baseUrl/$dirpath/$filename';
    return await ref.read(downloadUtilsProvider).downloadAndSaveImage(url, filename);
  }
}

final jelajahServiceProvider = Provider(JelajahService.new);
