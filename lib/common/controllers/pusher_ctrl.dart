import 'dart:developer';

import 'package:amoora/common/services/notification_service.dart';
import 'package:amoora/common/services/talker_service.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/auth/model/user.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/talker_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pusher_webman/pusher_webman.dart';
import 'package:uuid/uuid.dart';

final _kLogName = 'PUSHER-CTRL';

enum Type { subs, unsubs }

class PusherCtrl {
  Ref ref;
  PusherCtrl(this.ref) {
    _uuid = Uuid().v4();
  }

  final _prefixAnonymUserChannel = 'private-anonym-user';
  final _prefixLoggedUserChannel = 'private-logged-user';

  late String _uuid;
  late Pusher _pusher;
  String? _anonymUserChannel;
  String? _loggedUserChannel;
  Pusher get getPusher => _pusher;

  void initialize() async {
    log('Initialize Pusher !');

    connect();

    ref.listen(authUserProvider, (previous, next) async {
      _updateUserChannel(next);
    });

    // if (ref.read(authUserProvider) != null) {
    //   final user = ref.read(authUserProvider);
    //   _privateUserChannel(id: user?.id, type: Type.subs);
    //   _pusher.subscribe('presence-channel', userId: user?.id.toString(), userInfo: {"name": user?.name});
    // }
  }

  void connect() async {
    try {
      _pusher = Pusher(
        url: AppBase.pusherUrl,
        key: AppBase.pusherKey,
        auth: PusherAuth(AppBase.pusherAuthUrl),
        connectionState: (state) {
          ref.read(talkerProvider).logx("${state.name.toCamelCase()} to ${AppBase.pusherUrl}", name: _kLogName);
        },
        onSubscribed: (channelName) {
          ref.read(talkerProvider).logx("Subscribed to [$channelName]", name: _kLogName);
        },
        onError: (data) {
          ref.read(talkerProvider).logx("Error: $data", name: _kLogName);
        },
        showLog: false,
      );

      await _pusher.connect();

      _publicChannel();
      _updateUserChannel();
    } catch (e) {
      ref.read(talkerProvider).logx("$e", name: _kLogName);
    }
  }

  void _publicChannel({bool showLog = true}) {
    final channelName = 'public-channel';
    if (showLog) ref.read(talkerProvider).logx("Subscribe to Channel : $channelName", name: _kLogName);

    final channel = _pusher.subscribe(channelName);
    channel.bind('message', (event) {
      if (showLog) ref.read(talkerProvider).logx("$channelName:message: $event", name: _kLogName);

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
    channel.bind('promotion', (event) {
      if (showLog) ref.read(talkerProvider).logx("$channelName:promotion: $event", name: _kLogName);

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
  }

  void _updateUserChannel([User? user]) {
    user ??= ref.read(authUserProvider);
    if (user == null) {
      _anonymUserChannel = "$_prefixAnonymUserChannel-$_uuid";
      _pusher.subscribe(_anonymUserChannel!);
      if (_loggedUserChannel != null) {
        _pusher.unsubscribe(_loggedUserChannel!);
      }
    } else {
      _loggedUserChannel = "$_prefixLoggedUserChannel-${user.id}";
      _pusher.subscribe(_loggedUserChannel!);
      if (_anonymUserChannel != null) {
        _pusher.unsubscribe(_anonymUserChannel!);
      }
    }
  }

  // void _privateUserChannel({Type type = Type.subs, bool showLog = true}) {
  //   if (type == Type.unsubs) {
  //     _pusher.unsubscribe('private-user-$id');
  //     if (showLog) ref.read(talkerProvider).logx("private-user-$id:unsubscribe", name: _kLogName);
  //     return;
  //   }

  //   final channel = _pusher.subscribe('private-user-$id');
  //   channel.bind('message', (event) {
  //     if (showLog) ref.read(talkerProvider).logx("private-user-$id:message: $event", name: _kLogName);

  //     if (event != null) {
  //       String? title = event['title'].toString().isEmpty ? null : event['title'];
  //       String? message = event['message'];
  //       if (message != null) {
  //         // if (showLog) log("$title | $message", name: _kLogName);
  //         NotificationService.show(title: title, message: message);
  //       }
  //     }
  //   });
  //   channel.bind('intrusion', (event) {
  //     if (showLog) ref.read(talkerProvider).logx("private-user-$id:intrusion: $event", name: _kLogName);

  //     final deviceId = ref.read(deviceIdProvider);
  //     final deviceIdX = event['device_id'];
  //     if (deviceId == deviceIdX) return;

  //     if (event != null) {
  //       String? title = event['title'].toString().isEmpty ? null : event['title'];
  //       String? message = event['message'];
  //       if (message != null) {
  //         // if (showLog) log("$title | $message", name: _kLogName);
  //         NotificationService.show(title: title, message: message);
  //       }
  //     }
  //   });
  // }

  // Future<void> send({
  //   required String channel,
  //   required String event,
  //   required Map<String, dynamic> data,
  //   bool showLog = true,
  // }) async {
  //   final reqs = Reqs(path: '/api/v1/pusher/trigger', data: {
  //     "channel_name": channel,
  //     "event": event,
  //     "data": data,
  //   });
  //   final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

  //   if (state.hasError) {
  //     return;
  //   }

  //   return;
  // }
}

final pusherCtrlProvider = Provider(PusherCtrl.new);
