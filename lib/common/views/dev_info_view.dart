import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/services/device_service.dart';
import 'package:amoora/common/services/talker_service.dart';
import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/env/env.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DevInfoView extends ConsumerWidget {
  const DevInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Developer Info')),
        floatingActionButton: FloatingActionButton(
          backgroundColor: oBlack,
          onPressed: () => context.goto(page: TalkerScreen(talker: ref.read(talkerProvider))),
        ),
        body: ListView(
          children: [
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 5,
                children: [
                  FieldList(caption: Text('Environment'), value: Text(Env.envConfig)),
                  FieldList(caption: Text('End Point Url'), value: Text(AppBase.url)),
                  FieldList(caption: Text('Pusher Url'), value: Text(Env.pusherUrl)),
                  FieldList(caption: Text('Pusher Auth Url'), value: Text(Env.pusherAuthUrl)),
                  FieldList(
                    caption: Text('Screen Info'),
                    value: Text("${context.screenWidth.round()}x${context.screenHeight.round()} (WxH)"),
                  ),
                  FieldList(caption: Text('Device Id'), value: Text(ref.read(deviceIdProvider))),
                  FieldList(caption: Text('Device Name'), value: Text(ref.read(deviceNameProvider))),
                  FieldList(caption: Text('Location'), value: Text(ref.read(locationProvider))),
                  FieldList(caption: Text('WiFi Name'), value: Text(ref.read(wifiNameProvider))),
                  FieldList(caption: Text('WiFi BSSID'), value: Text(ref.read(wifiBSSIDProvider))),
                  FieldList(caption: Text('IP Address'), value: Text(ref.read(wifiIPv4Provider))),
                  FieldList(caption: Text('WiFi Gateway'), value: Text(ref.read(wifiGatewayIPProvider))),
                  FieldList(caption: Text('WiFi Broadcast'), value: Text(ref.read(wifiBroadcastProvider))),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
