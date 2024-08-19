import 'package:amoora/common/services/package_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getVersionProvider = FutureProvider<String>((ref) async {
  return await ref.read(packageInfoServiceProvider).getVersion();
});
