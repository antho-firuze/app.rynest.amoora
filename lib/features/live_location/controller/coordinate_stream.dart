import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/common/services/location_service.dart';
import 'package:amoora/common/services/stream_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_location/controller/live_maps_ctrl.dart';
import 'package:amoora/features/live_location/model/member.dart';
import 'package:amoora/features/user/controller/user_setting_ctrl.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoordinateStream {
  Ref ref;
  CoordinateStream(this.ref);

  StreamSubscription? _myPositionStreamSubs;
  StreamSubscription? _pushStreamSubs;
  StreamSubscription<SseMessage>? _fetchStreamSubs;
  LatLong? lastLatLong;

  // This is special for Role <> 1, using for update my location position
  void fetchMyCoordinate() {
    if (_myPositionStreamSubs != null) {
      _closedMyCoordinate();
    }

    // CHECK USER LOGIN
    if (ref.read(authUserProvider) == null) {
      return;
    }

    // CHECK USER ROLE
    if (![2, 99].contains(ref.read(authUserProvider)?.roleId)) {
      log('_fetchMyCoordinate => Not active. This is for role <> 1 (roleId = ${ref.read(authUserProvider)?.roleId})',
          name: 'COORDINATE-STREAM');
      return;
    }

    _myPositionStreamSubs = _fetchCoordinateStream().listen((latLong) {
      ref.read(liveMapsCtrlProvider).setMyPosition(latLong);
    });
  }

  void _closedMyCoordinate() {
    _myPositionStreamSubs?.cancel();
    _myPositionStreamSubs == null;
    log('_fetchMyCoordinate => stoped', name: 'COORDINATE-STREAM');
  }

  Future monitoringMember() async {
    if (_fetchStreamSubs != null) {
      _closedMonitoringMember();
    }

    // CHECK USER LOGIN
    if (ref.read(authUserProvider) == null) {
      return;
    }

    // CHECK USER ROLE
    if (![2, 99].contains(ref.read(authUserProvider)?.roleId)) {
      log('_monitoringMember => Not allowed. Your role is sufficient (roleId = ${ref.read(authUserProvider)?.roleId})',
          name: 'COORDINATE-STREAM');
      return;
    }

    log('_monitoringMember => start', name: 'COORDINATE-STREAM');

    final reqs = Reqs(
      data: {"stream_type": "online_member"},
    );
    final fetchStream = await ref.read(streamServiceProvider).call(reqs: reqs);

    _fetchStreamSubs = fetchStream?.listen((event) {
      log("_monitoringMember => Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}",
          name: 'COORDINATE-STREAM');

      if (event.data.isEmpty) {
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isEmpty) {
        // log('empty => $jsonList');
        ref.read(onlineMemberProvider.notifier).state = [];
      } else {
        List<Member> datas = jsonList.map((json) => Member.fromJson(json)).toList();
        // log('total online: ${datas.length}');
        ref.read(onlineMemberProvider.notifier).state = datas;
      }
    });
  }

  void _closedMonitoringMember() {
    _fetchStreamSubs?.cancel();
    _fetchStreamSubs == null;
    ref.read(onlineMemberProvider.notifier).state = [];
    log('_monitoringMember => closed', name: 'COORDINATE-STREAM');
  }

  // THIS LOGIC USING "WHILE TRUE LOOPING".
  Stream<LatLong> _fetchCoordinateStream() async* {
    while (true) {
      yield await ref.read(locationServiceProvider).fetchCurrentCoordinate();

      await Future.delayed(const Duration(minutes: 1));
    }
  }

  void pushCoordinate() async {
    if (_pushStreamSubs != null) {
      _closedPushCoordinate();
    }

    // CHECK USER LOGIN
    if (ref.read(authUserProvider) == null) {
      return;
    }

    // CHECK USER ROLE
    if (ref.read(authUserProvider)!.roleId != 1) {
      log('_pushCoordinate => Not active. This is for role == 1 (roleId = ${ref.read(authUserProvider)?.roleId})',
          name: 'COORDINATE-STREAM');
      return;
    }

    if (!ref.read(isGpsEnableProvider) || !ref.read(allowGpsProvider)) {
      log('_pushCoordinate => isGpsEnableProvider : ${ref.read(isGpsEnableProvider)} || allowGpsProvider : ${ref.read(allowGpsProvider)}',
          name: 'COORDINATE-STREAM');
      return;
    }

    if (!ref.read(allowMonitorLocationProvider)) {
      log('_pushCoordinate => allowMonitorLocationProvider : false', name: 'COORDINATE-STREAM');
      return;
    }

    if (ref.read(allowMonitorInArabOnlyProvider)) {
      log('_pushCoordinate => allowMonitorInArabOnlyProvider : true', name: 'COORDINATE-STREAM');
      var placemark = ref.read(placemarkProvider);
      log('_pushCoordinate => Your placemark: ${placemark?.isoCountryCode}', name: 'COORDINATE-STREAM');
      if (!['AE', 'SA'].contains(placemark?.isoCountryCode)) {
        log('_pushCoordinate => Sorry, you are not in Arab Saudi !', name: 'COORDINATE-STREAM');
        return;
      }
    }

    log('_pushCoordinate => start', name: 'COORDINATE-STREAM');
    _pushStreamSubs = _fetchCoordinateStream().listen((latLong) async {
      if (latLong.isEmpty()) {
        return;
      }

      if (latLong == lastLatLong) {
        Future.delayed(const Duration(minutes: 1));
        return;
      }

      ref.read(myPositionProvider.notifier).state = latLong;
      log('_pushCoordinate => currPosition : $latLong !', name: 'COORDINATE-STREAM');

      final reqs = Reqs(
        path: '/api/v1/maps/save_location',
        data: {
          "lat": latLong.lat,
          "lng": latLong.lng,
          "label": '',
          "heartbeat": DateTime.now().dbDateTime(),
        },
      );
      await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      lastLatLong = latLong;
    });
  }

  void _closedPushCoordinate() {
    _pushStreamSubs?.cancel();
    _pushStreamSubs == null;
    log('_pushCoordinate => closed', name: 'COORDINATE-STREAM');
  }
}

final coordinateStreamProvider = Provider(CoordinateStream.new);
