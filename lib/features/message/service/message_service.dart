import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAnyChatProvider = StateProvider<bool>((ref) => true);

final messageSvc = Provider(MessageSvc.new);

class MessageSvc {
  final Ref ref;

  MessageSvc(this.ref);
}
