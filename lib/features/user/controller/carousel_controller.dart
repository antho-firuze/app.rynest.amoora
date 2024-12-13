import 'dart:developer';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/features/user/model/carousel.dart';
import 'package:amoora/utils/custom_carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCarouselController = CustomCarouselController();

final fetchCarouselProvider = FutureProvider.autoDispose<List<Carousel>>((ref) async {
  final reqs = Reqs(path: '/api/v1/carousel/all');
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

  if (state.hasError) return [];

  List<dynamic> jsonList = state.value;
  if (jsonList.isEmpty) return [];

  final result = jsonList.map((json) => Carousel.fromJson(json)).toList();
  log('fetchCarouselProvider | $result', name: 'carousel_controller');

  return result;
});
