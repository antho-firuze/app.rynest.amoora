import 'dart:convert';

import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/common/widgets/icon_text.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/live_streaming/controller/audience_controller.dart';
import 'package:amoora/features/live_streaming/controller/signaling_controller.dart';
import 'package:amoora/features/live_streaming/model/presenter.dart';
import 'package:amoora/features/live_streaming/service/signaling_service.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class AudienceView extends ConsumerWidget {
  const AudienceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineHostStream = ref.watch(onlineHostStreamProvider);
    final selectedPresenter = ref.watch(selectedPresenterProvider);

    WakelockPlus.enable();

    // if (!ref.watch(allowMicrophoneProvider)) {
    //   return PopScope(
    //     canPop: false,
    //     onPopInvoked: (didPop) {
    //       if (didPop) return;

    //       WakelockPlus.disable();
    //       context.pop();
    //     },
    //     child: MyUI(
    //       child: Scaffold(
    //         appBar: AppBar(title: Text('Dengarkan Siaran Live'.hardcoded)),
    //         body: ListView(
    //           children: [
    //             WarningException(
    //               message: 'Izinkan penggunaan Microphone !',
    //               child: ElevatedButton(
    //                 onPressed: () async => await ref.read(broadcastCtrlProvider).requestMicrophonePermission(),
    //                 child: Text('Izinkan Akses'.hardcoded),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        WakelockPlus.disable();
        context.pop();
      },
      child: MyUI(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dengarkan Siaran Live'.hardcoded),
            actions: [
              IconButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) => MyUI(
                      isTransparent: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(child: Text('STUN/TURN Server :')),
                                Center(
                                  child: Text(
                                    '${serverName[ref.watch(serverProvider)]}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                          if (selectedPresenter == null) ...[
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text('Set STUN/TURN Server :'),
                            ),
                            ListTile(
                              title: Text('${serverName[Server.rynest36]}'),
                              onTap: () {
                                ref.read(serverProvider.notifier).state = Server.rynest36;
                                if (context.mounted) context.pop();
                              },
                            ),
                            ListTile(
                              title: Text('${serverName[Server.google]}'),
                              onTap: () {
                                ref.read(serverProvider.notifier).state = Server.google;
                                if (context.mounted) context.pop();
                              },
                            ),
                            // ListTile(
                            //   title: Text('${serverName[Server.meteredCA]}'),
                            //   onTap: () {
                            //     ref.read(serverProvider.notifier).state = Server.meteredCA;
                            //     if (context.mounted) context.pop();
                            //   },
                            // ),
                            // ListTile(
                            //   title: Text('${serverName[Server.twilio]}'),
                            //   onTap: () {
                            //     ref.read(serverProvider.notifier).state = Server.twilio;
                            //     if (context.mounted) context.pop();
                            //   },
                            // ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
                tooltip: 'STUN/TURN Server',
                icon: const Icon(SuperIcons.cl_server_solid),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async => await ref.read(audienceCtrlProvider).refresh(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  20.height,
                  if (selectedPresenter != null) ...[
                    Card(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              30.height,
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                                child: AvatarGlow(
                                  glowRadiusFactor: .2,
                                  glowColor: Colors.green,
                                  glowShape: BoxShape.rectangle,
                                  child: SizedBox.square(
                                    dimension: 250,
                                    child: Image.network(
                                      '${AppBase.prodUrl}${selectedPresenter.profile!.photo}',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                        'assets/images/sample/avatar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              30.height,
                              Consumer(
                                builder: (context, ref, child) {
                                  return ref.watch(liveTimeHostProvider(selectedPresenter.createdAt!)).when(
                                        data: (data) => Text(data),
                                        error: (error, stackTrace) => Container(),
                                        loading: () => Container(),
                                      );
                                },
                              ),
                              20.height,
                              divider(),
                              20.height,
                              Text(selectedPresenter.label).tsTitleL(),
                              5.height,
                              Text(selectedPresenter.profile?.fullName ?? ''),
                              20.height,
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CloseButton(
                              onPressed: ref.read(audienceCtrlProvider).leaveMeeting,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                  ],
                  onlineHostStream.when(
                    data: (data) {
                      if (data == null || data.data.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(child: DataFailed(message: 'Belum ada pembicara saat ini !')),
                        );
                      }

                      List<Presenter> onlineHost = [];
                      List<dynamic> jsonList = jsonDecode(data.data);
                      onlineHost = jsonList.map((json) => Presenter.fromJson(json)).toList();
                      if (onlineHost.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(child: DataFailed(message: 'Belum ada pembicara saat ini !')),
                        );
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [
                              Text('Siaran Live'.hardcoded).tsTitleL(),
                              10.width,
                              Text("( ${onlineHost.length} Host )"),
                            ],
                          ),
                          ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: onlineHost.length,
                            itemBuilder: (context, index) {
                              final presenter = onlineHost[index];
                              final isSelected = presenter.id == selectedPresenter?.id;
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: CustomCircleButton(
                                      child: Image.network(
                                        '${AppBase.prodUrl}${presenter.profile!.photo}',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Image.asset(
                                          'assets/images/sample/avatar.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(presenter.label).tsTitleL().clr(isSelected ? oGold : null),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(presenter.profile?.fullName ?? ''),
                                      5.height,
                                      Row(
                                        children: [
                                          const Icon(SuperIcons.is_activity_outline, size: 17, color: oGreen),
                                          // Icon(Iconsax.activity_copy, size: 17, color: sameNetwork ? oGreen : oRed),
                                          3.width,
                                          // Text(presenter.ipBroadcast.isEmpty ? '*.*.*.*' : presenter.ipBroadcast)
                                          //     .tsLabelL()
                                          //     .clr(sameNetwork ? oGreen : oRed),
                                          5.width,
                                          const Text('|'),
                                          5.width,
                                          const Icon(SuperIcons.is_ocean_protocol_ocean_outline, size: 17),
                                          3.width,
                                          // Text('Port: ${presenter.port}').tsLabelL(),
                                        ],
                                      ),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          return ref.watch(liveTimeHostProvider(presenter.createdAt!)).when(
                                                data: (data) => IconText(
                                                  text: Text('Online: $data').tsLabelL(),
                                                  icon: const Icon(SuperIcons.is_radar_1_outline, size: 17),
                                                ),
                                                error: (error, stackTrace) => Container(),
                                                loading: () => Container(),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(SuperIcons.is_headphone_outline, color: isSelected ? oGold : null),
                                  onTap: () async => await ref.read(audienceCtrlProvider).joinMeeting(presenter),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => 10.height,
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) => Center(child: Text('$error')),
                    loading: () => const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
