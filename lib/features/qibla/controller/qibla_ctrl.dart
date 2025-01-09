import 'package:amoora/features/qibla/service/qibla_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDeviceSensorSupportProvider =
    FutureProvider<bool>((ref) async => await ref.read(qiblaServiceProvider).checkDeviceSensorSupport());
