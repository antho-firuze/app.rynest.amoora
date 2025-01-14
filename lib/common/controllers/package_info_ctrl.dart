import 'package:amoora/common/services/package_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchVersionProvider =
    FutureProvider<String>((ref) async => await ref.read(packageInfoServiceProvider).getVersion());
