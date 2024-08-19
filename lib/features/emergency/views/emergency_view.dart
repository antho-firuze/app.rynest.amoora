import 'package:amoora/common/exceptions/loading_failed.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/emergency/controller/emergency_controller.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyView extends ConsumerWidget {
  const EmergencyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Emergency Call (SOS)')),
        body: RefreshIndicator(
          onRefresh: () async => ref.refresh(emergenciesProvider),
          child: ListView(
            shrinkWrap: true,
            children: [
              10.height,
              ref.watch(emergenciesProvider).when(
                    skipLoadingOnRefresh: false,
                    error: (error, stackTrace) => const LoadingFailed(),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    data: (data) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: data.length,
                        separatorBuilder: (context, index) => 20.height,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 60,
                              height: 70,
                              decoration: BoxDecoration(color: oRed50, borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.crisis_alert_outlined, color: oWhite),
                            ),
                            title: Text(item.title ?? '').tsTitleL().bold(),
                            subtitle: Text(item.phone ?? '').bold(),
                            trailing: const Icon(Icons.chevron_right, size: 40),
                            onTap: () => showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                              ),
                              builder: (context) {
                                return MyUI(
                                  isTransparent: true,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: CloseButton(onPressed: () => context.pop()),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                                              child: Text(item.title ?? '').bold(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      divider(),
                                      20.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomCircleButton(
                                            onTap: item.phone == null || item.phone!.isEmpty
                                                ? null
                                                : () => launchUrl(Uri.parse('tel:${item.phone!}')),
                                            size: 90,
                                            decoration: const BoxDecoration(color: oRed50),
                                            padding: const EdgeInsets.all(12),
                                            child: const Icon(SuperIcons.is_call_outline, size: 45, color: oWhite),
                                          ),
                                          if (item.whatsapp != null && item.whatsapp!.isNotEmpty)
                                            CustomCircleButton(
                                              onTap: () => launchUrl(Uri.parse('https://wa.me/${item.whatsapp!}')),
                                              size: 90,
                                              decoration: const BoxDecoration(color: oRed50),
                                              padding: const EdgeInsets.all(12),
                                              child: const Icon(SuperIcons.is_whatsapp_outline,
                                                  size: 45, color: Colors.green),
                                            ),
                                        ],
                                      ),
                                      20.height,
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}
