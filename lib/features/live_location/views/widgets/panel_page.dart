import 'dart:developer';

import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/live_location/controller/live_maps_controller.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PanelPage extends ConsumerWidget {
  const PanelPage({
    super.key,
    required this.sc,
  });

  final ScrollController sc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(refreshMapsProvider);
    final members = ref.read(liveMapsCtrlProvider).getOnlineMember();
    // final members = ref.watch(onlineMemberProvider);
    final memberOutOfRange = members.where((member) => member.isOutOfRange == true).toList();
    final radius = ref.read(liveMapsCtrlProvider).getRadiusCircle.round();

    if (members.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 35),
        child: Scaffold(
          body: DataFailed(
            message: "Tidak ada Jama'ah yang sedang online !",
          ),
        ),
      );
    }

    log('Build Panel Maps', name: 'live-maps');
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: MyUI(
        child: Scaffold(
          body: ListView(
            controller: sc,
            children: [
              if (memberOutOfRange.isNotEmpty) ...[
                10.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Jama'ah diluar jangkauan (${radius}m) = ${members.length} orang"),
                ),
              ],
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Total Jama'ah yang terpantau = ${members.length} orang"),
              ),
              10.height,
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: members.length,
                separatorBuilder: (context, index) => 10.height,
                itemBuilder: (context, index) {
                  final member = members[index];
                  final isOutOfRange = member.isOutOfRange;
                  return Card(
                    color: isOutOfRange ? oRed70 : null,
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
                                  '${AppBase.prodUrl}${member.profile!.photo}',
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
                              '${AppBase.prodUrl}${member.profile!.photo}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                'assets/images/sample/avatar.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(member.profile!.fullName).tsTitleL().clr(isOutOfRange ? oWhite : null),
                      subtitle: Text(member.profile?.name ?? '').clr(isOutOfRange ? oWhite : null),
                      trailing: GestureDetector(
                        onTap: () => ref
                            .read(liveMapsCtrlProvider)
                            .changeFocusPosition([member.lat, member.lng], 'markerId_${member.userId}'),
                        child: Icon(SuperIcons.lc_arrowRight, color: isOutOfRange ? oWhite : null),
                      ),
                      onTap: () async => showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        shape: const BeveledRectangleBorder(),
                        builder: (context) => MyUI(
                          isTransparent: true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView(
                              children: [
                                20.height,
                                Center(
                                  child: CustomCircleButton(
                                    size: 150,
                                    padding: EdgeInsets.zero,
                                    child: Image.network(
                                      '${AppBase.prodUrl}${member.profile!.photo}',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                        'assets/images/sample/avatar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                20.height,
                                FieldList(
                                  caption: const Text('Nama Lengkap'),
                                  value: Text(member.profile!.fullName).right().bold(),
                                ),
                                20.height,
                                FieldList(
                                  caption: const Text('Nama Panggilan'),
                                  value: Text(member.profile!.name).right().bold(),
                                ),
                                20.height,
                                FieldList(
                                  caption: const Text('Alamat Email'),
                                  value: Text(member.profile!.email).right().bold(),
                                  width: context.screenWidthRatio(.6, .6),
                                ),
                                20.height,
                                FieldList(
                                  caption: const Text('No Telp'),
                                  value: Text(member.profile!.phone).right().bold().link(
                                        color: oGold200,
                                        onTap: () => launchUrl(Uri.parse('tel:${member.profile!.phone}')),
                                      ),
                                ),
                                20.height,
                                FieldList(
                                  caption: const Text('Alamat'),
                                  value: Text(member.profile!.address).right().bold(),
                                ),
                                20.height,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
