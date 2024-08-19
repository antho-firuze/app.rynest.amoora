import 'package:flutter_riverpod/flutter_riverpod.dart';

final allowGpsProvider = StateProvider<bool>((ref) => false);
final isGpsEnableProvider = StateProvider<bool>((ref) => false);
final allowCameraAndStorageProvider = StateProvider<bool>((ref) => false);
final allowMicrophoneProvider = StateProvider<bool>((ref) => false);
final allowAlertProvider = StateProvider<bool>((ref) => false);
final isBatteryOptzDisabledProvider = StateProvider<bool>((ref) => false);
final isAutoStartEnabledProvider = StateProvider<bool>((ref) => false);
