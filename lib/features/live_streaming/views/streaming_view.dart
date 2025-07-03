import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/data_exeception_layout.dart';
import 'package:amoora/common/exceptions/warning_layout.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/live_streaming/controller/audio_stream_signaling.dart';
import 'package:amoora/features/live_streaming/controller/streaming_ctrl.dart';
import 'package:amoora/features/live_streaming/views/streamer_view.dart';
import 'package:amoora/features/live_streaming/views/widgets/config_dialog.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class StreamingView extends ConsumerStatefulWidget {
  const StreamingView({super.key});

  @override
  ConsumerState<StreamingView> createState() => _StreamingViewState();
}

class _StreamingViewState extends ConsumerState<StreamingView> {
  @override
  void initState() {
    ref.refresh(streamerCountListenerProvider);
    // ref.read(streamingCtrlProvider).openUserMedia();
    super.initState();
  }

  @override
  void deactivate() {
    // ref.read(streamingCtrlProvider).closedUserMedia();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(allowMicrophoneProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.microphonePermissionTitle,
                subTitle: PermissionString2.microphonePermissionSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(streamingCtrlProvider).requestMicrophonePermission(),
                  child: Text('Izinkan Akses'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsDeviceTitle,
                subTitle: PermissionString2.gpsDeviceSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(permissionServiceProvider).openLocationSettings(),
                  child: Text('Aktifkan GPS'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(allowGpsProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsPermissionTitle,
                subTitle: PermissionString2.gpsPermissionSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(locationCtrlProvider).requestGpsPermission(),
                  child: Text('Izinkan Akses'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    WakelockPlus.enable();

    // Streamer view
    final streamer = ref.watch(selfStreamerProvider);
    if (streamer != null) {
      debugPrint("Streamer view");
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchStreamerStatusProvider(streamer.id)),
            child: ListView(
              shrinkWrap: true,
              children: [
                20.height,
                ref.watch(fetchStreamerStatusProvider(streamer.id)).when(
                      data: (data) {
                        if (data == null) {
                          return Center(child: CircularProgressIndicator());
                        }
                        bool isOnline = data.finishedAt == null;

                        if (isOnline == false) {
                          ref.read(streamingCtrlProvider).closedUserMedia();
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  spacing: 10,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(40, 80, 40, 70),
                                      child: isOnline
                                          ? AvatarGlow(
                                              glowColor: Colors.green,
                                              glowShape: BoxShape.circle,
                                              child: Icon(SuperIcons.bs_mic, size: 100),
                                            )
                                          : Icon(SuperIcons.bs_mic_mute, size: 100),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Streaming : ').bold(),
                                              Text(isOnline ? 'LIVE' : 'STOPPED').bold().clr(oRed),
                                            ],
                                          ),
                                          if (isOnline)
                                            Consumer(
                                              builder: (context, ref, child) {
                                                return ref.watch(liveTimeProvider(streamer.startedAt!)).when(
                                                      data: (data) => Text(data).family('Roboto'),
                                                      error: (error, stackTrace) => Container(),
                                                      loading: () => Container(),
                                                    );
                                              },
                                            )
                                          else
                                            Text(ref
                                                    .read(streamingCtrlProvider)
                                                    .calcLiveTimeLength(data.startedAt!, data.finishedAt!))
                                                .family('Roboto'),
                                        ],
                                      ),
                                    ),
                                    divider(),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 5,
                                        children: [
                                          Text(streamer.title).tsTitleL(),
                                          Consumer(
                                            builder: (context, ref, child) {
                                              return ref
                                                  .watch(fetchViewersCountProvider(streamer.signalingChannel))
                                                  .when(
                                                      data: (data) {
                                                        int views = data == null ? 0 : data.liveViews;
                                                        return Text(
                                                                "$views views Started streaming on ${streamer.startedAt?.custom('MMM d yyyy hh:mm a')}")
                                                            .bold();
                                                      },
                                                      error: (error, stackTrace) => Text(error.toString()),
                                                      loading: () => CircularProgressIndicator());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CloseButton(
                                    onPressed: () async => await ref
                                        .read(streamingCtrlProvider)
                                        .stopStreaming(streamerId: ref.read(selfStreamerProvider)!.id),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
                20.height,
              ],
            ),
          ),
        ),
      );
    }

    // On Connecting Process
    final eventType = ref.watch(eventTypeProvider);
    if (![EventType.accept, EventType.failed, EventType.exit, EventType.stop, null].contains(eventType)) {
      debugPrint("On Connecting Process : ${eventType?.name}");
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: Center(
            child: Column(
              spacing: 40,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Sedang menghubungkan jaringan...."),
                Center(child: CircularProgressIndicator()),
                Center(
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async => await ref.read(streamingCtrlProvider).cancelListening(),
                      child: Text('Cancel'.hardcoded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Listener view
    final selected = ref.watch(selectedStreamerProvider);
    if (selected != null) {
      debugPrint("Listener view");
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
          body: ListView(
            shrinkWrap: true,
            children: [
              20.height,
              ref.watch(fetchStreamerStatusProvider(selected.id)).when(
                    data: (data) {
                      if (data == null) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final event = ref.watch(eventTypeProvider);
                      bool isOnline = event == EventType.accept;
                      DateTime finishAt = data.finishedAt ?? DateTime.now();
                      // bool isOnline = data.finishedAt == null;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 10,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 80, 40, 70),
                                    child: isOnline
                                        ? AvatarGlow(
                                            glowColor: Colors.green,
                                            glowShape: BoxShape.circle,
                                            child: Icon(SuperIcons.bs_headphones, size: 100),
                                          )
                                        : Icon(SuperIcons.ev_slash_outline, size: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Listening : ').bold(),
                                            Text(isOnline ? 'LIVE' : 'STOPPED').bold().clr(oRed),
                                          ],
                                        ),
                                        if (isOnline)
                                          Consumer(
                                            builder: (context, ref, child) {
                                              return ref.watch(liveTimeProvider(selected.startedAt!)).when(
                                                    data: (data) => Text(data).family('Roboto'),
                                                    error: (error, stackTrace) => Container(),
                                                    loading: () => Container(),
                                                  );
                                            },
                                          )
                                        else
                                          Text(ref
                                                  .read(streamingCtrlProvider)
                                                  .calcLiveTimeLength(data.startedAt!, finishAt))
                                              .family('Roboto'),
                                      ],
                                    ),
                                  ),
                                  divider(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Text(selected.title).tsTitleL(),
                                        Consumer(
                                          builder: (context, ref, child) {
                                            return ref.watch(fetchViewersCountProvider(selected.signalingChannel)).when(
                                                data: (data) {
                                                  int views = data == null ? 0 : data.liveViews;
                                                  return Text(
                                                          "$views views Started streaming on ${selected.startedAt?.custom('MMM d yyyy hh:mm a')}")
                                                      .bold();
                                                },
                                                error: (error, stackTrace) => Text(error.toString()),
                                                loading: () => CircularProgressIndicator());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: CloseButton(
                                  onPressed: () async => await ref.read(streamingCtrlProvider).exitListening(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => CircularProgressIndicator(),
                  ),
              20.height,
            ],
          ),
        ),
      );
    }

    // List of Streamers view
    debugPrint("List of Streamers view");
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
            title: Text('Siaran Live'.hardcoded),
            actions: [
              IconButton(
                tooltip: 'Siaran Baru',
                icon: const Icon(SuperIcons.is_radar_1_outline),
                onPressed: () async => await context.goto(page: StreamerView()),
              ),
              IconButton(
                tooltip: 'Config',
                icon: const Icon(SuperIcons.ev_settings_outline),
                onPressed: () async => await showDialog(
                  context: context,
                  builder: (context) => ConfigDialog(),
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.red,
          //   onPressed: () => ref.read(streamingCtrlProvider).exit(streamer: ref.read(selectedStreamerProvider)),
          // ),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchStreamersProvider),
            child: ListView(
              children: [
                20.height,
                ref.watch(fetchStreamersProvider).when(
                      skipLoadingOnRefresh: false,
                      data: (data) {
                        debugPrint('streamer : $data');

                        if (data == null) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (data.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ExceptionLayout(
                              image: 'assets/images/im-warning.png',
                              message: "Belum ada yang siaran, silahkan cek lagi nanti.",
                              onTap: () => ref.refresh(fetchStreamersProvider),
                            ),
                          );
                        }

                        debugPrint("streamer : ${data.length}");
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          itemBuilder: (context, index) {
                            final item = data[index];

                            // debugPrint("streamer_id : ${item.id}");
                            return ref.watch(fetchStreamerByIdProvider(item.id)).when(
                                  skipLoadingOnRefresh: false,
                                  data: (data) {
                                    if (data == null) {
                                      debugPrint("streamer_id (null) : ${item.id}");
                                      return ListTile(
                                        title: Text('Unknown Streamer ! [streamer_id : ${item.id}]'),
                                      );
                                    }

                                    return Card(
                                      child: ListTile(
                                        title: Text(data.title).tsTitleL(),
                                        subtitle: Text(
                                            "${item.views} views Streamed live on ${data.startedAt?.custom('MMM d')}"),
                                        trailing: AvatarGlow(
                                          glowColor: Colors.green,
                                          glowShape: BoxShape.circle,
                                          child: Icon(SuperIcons.is_radar_1_outline),
                                        ),
                                        onTap: () async =>
                                            await ref.read(streamingCtrlProvider).joinListening(streamer: data),
                                      ),
                                    );
                                  },
                                  error: (error, stackTrace) => Container(),
                                  loading: () => Center(child: CircularProgressIndicator()),
                                );
                          },
                          separatorBuilder: (context, index) => 5.height,
                          itemCount: data.length,
                        );
                      },
                      error: (error, stackTrace) => WarningLayout(title: error.toString()),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
