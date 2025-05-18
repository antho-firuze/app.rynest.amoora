import 'dart:convert';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/data_exeception_layout.dart';
import 'package:amoora/common/exceptions/warning_layout.dart';
import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/live_streaming/controller/broadcast_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/presenter_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/signaling_ctrl.dart';
import 'package:amoora/features/live_streaming/model/audience.dart';
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

class PresenterView extends ConsumerWidget {
  const PresenterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    final presenter = ref.watch(presenterProvider);

    WakelockPlus.enable();

    if (!ref.watch(allowMicrophoneProvider)) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          WakelockPlus.disable();
          context.pop();
        },
        child: MyUI(
          child: Scaffold(
            appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
            body: ListView(
              children: [
                WarningLayout(
                  title: PermissionString2.microphonePermissionTitle,
                  subTitle: PermissionString2.microphonePermissionSubTitle,
                  child: ElevatedButton(
                    onPressed: () async => await ref.read(broadcastCtrlProvider).requestMicrophonePermission(),
                    child: Text('Izinkan Akses'.hardcoded),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) => MyUI(
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
                                if (presenter == null) ...[
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
            onRefresh: () async => await ref.read(presenterCtrlProvider).refresh(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: (presenter == null)
                  ? ListView(
                      shrinkWrap: true,
                      children: [
                        Form(
                          key: formStateKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                20.height,
                                const Text("Silahkan masukkan Judul Materi/Ceramah.").tsTitleL().center(),
                                20.height,
                                CustomInput(
                                  onChanged: (val) => ref.read(labelStreamingProvider.notifier).state = val,
                                  hintText: 'Judul',
                                  keyboardType: TextInputType.text,
                                  prefixIcon: const Icon(SuperIcons.is_microphone_2_outline),
                                  validator: (p0) => p0!.isEmpty ? 'Kolom Judul harap di isi'.hardcoded : null,
                                ),
                                20.height,
                                CustomButton(
                                  busy: false,
                                  width: double.infinity,
                                  child: Text('Mulai Streaming'.hardcoded),
                                  onPressed: () async {
                                    if (formStateKey.currentState!.validate() == false) {
                                      return;
                                    }
                                    ref.read(presenterCtrlProvider).startMeeting();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        20.height,
                        Card(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                                    child: AvatarGlow(
                                      glowRadiusFactor: .1,
                                      glowColor: Colors.green,
                                      glowShape: BoxShape.circle,
                                      child: CustomCircleButton(
                                        size: 250,
                                        child: Image.network(
                                          '${AppBase.prodUrl}${presenter.profile!.photo}',
                                          fit: BoxFit.cover,
                                        ),
                                        // child: Image.network(
                                        //   'https://fastly.picsum.photos/id/669/512/512.jpg?hmac=zgZqPOl201OuVoHAfqiSmLMiWbd-3nkY3p8SiCfOEJQ',
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                  ),
                                  20.height,
                                  Consumer(
                                    builder: (context, ref, child) {
                                      return ref.watch(liveTimeProvider(presenter.createdAt!)).when(
                                            data: (data) => Text(data),
                                            error: (error, stackTrace) => Container(),
                                            loading: () => Container(),
                                          );
                                    },
                                  ),
                                  10.height,
                                  divider(),
                                  20.height,
                                  Text(presenter.label).tsTitleL(),
                                  5.height,
                                  Text(presenter.profile?.fullName ?? ''),
                                  20.height,
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: CloseButton(
                                  onPressed: () async => await ref.read(presenterCtrlProvider).closeMeeting(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.height,
                        ref.watch(onlineParticipantStreamProvider(presenter.id)).when(
                              data: (data) {
                                if (data == null || data.data.isEmpty) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pendengar Anda'.hardcoded).tsTitleL(),
                                      const Center(
                                        child: DataExceptionLayout(
                                          type: ExeceptionType.dataEmpty,
                                          title: 'Belum ada pendengar saat ini !',
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                List<Audience> participant = [];
                                List<dynamic> jsonList = jsonDecode(data.data);
                                participant = jsonList.map((json) {
                                  json['offer'] = null;
                                  json['answer'] = null;
                                  return Audience.fromJson(json);
                                }).toList();

                                if (participant.isEmpty) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pendengar Anda'.hardcoded).tsTitleL(),
                                      const Center(
                                        child: DataExceptionLayout(
                                          type: ExeceptionType.dataEmpty,
                                          title: 'Belum ada pendengar saat ini !',
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Pendengar Anda'.hardcoded).tsTitleL(),
                                        10.width,
                                        Text("( ${participant.length} orang )"),
                                      ],
                                    ),
                                    ListView.separated(
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: participant.length,
                                      itemBuilder: (context, index) {
                                        final audience = participant[index];
                                        return Card(
                                          child: ListTile(
                                            leading: GestureDetector(
                                              onTap: () => showDialog(
                                                context: context,
                                                builder: (context) => CircleAvatar(
                                                  // backgroundImage: NetworkImage('${AppBase.prodUrl}${participant.profile!.photo}'),
                                                  child: Center(
                                                    child: CustomCircleButton(
                                                      padding: EdgeInsets.zero,
                                                      child: Image.network(
                                                        '${AppBase.prodUrl}${audience.profile!.photo}',
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context, error, stackTrace) => Image.asset(
                                                          'assets/images/sample/avatar.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                // backgroundImage: NetworkImage('${AppBase.prodUrl}${participant.profile!.photo}'),
                                                child: CustomCircleButton(
                                                  child: Image.network(
                                                    '${AppBase.prodUrl}${audience.profile!.photo}',
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                      'assets/images/sample/avatar.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            title: Text(audience.profile!.fullName).tsTitleL(),
                                            subtitle: Text(audience.profile?.name ?? ''),
                                            trailing: const Icon(SuperIcons.is_personalcard_outline),
                                            onTap: () async => showModalBottomSheet(
                                              context: context,
                                              useSafeArea: true,
                                              shape: const BeveledRectangleBorder(),
                                              builder: (context) => Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    20.height,
                                                    FieldList(
                                                      caption: const Text('Nama Lengkap'),
                                                      value: Text(audience.profile!.fullName).right().bold(),
                                                    ),
                                                    20.height,
                                                    FieldList(
                                                      caption: const Text('Nama Panggilan'),
                                                      value: Text(audience.profile!.name).right().bold(),
                                                    ),
                                                    20.height,
                                                    FieldList(
                                                      caption: const Text('Alamat Email'),
                                                      value: Text(audience.profile!.email).right().bold(),
                                                    ),
                                                    20.height,
                                                    FieldList(
                                                      caption: const Text('No Telp'),
                                                      value: Text(audience.profile!.phone).right().bold(),
                                                    ),
                                                    20.height,
                                                    FieldList(
                                                      caption: const Text('Alamat'),
                                                      value: Text(audience.profile!.address).right().bold(),
                                                    ),
                                                    20.height,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) => 10.height,
                                    ),
                                  ],
                                );
                              },
                              error: (error, stackTrace) => Center(child: Text(error.toString())),
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
