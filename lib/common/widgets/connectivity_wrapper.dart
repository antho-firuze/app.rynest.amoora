import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/services/dialog_service.dart';
import 'package:amoora/common/widgets/forms/ordered_list.dart';
import 'package:amoora/common/widgets/overlay_container.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({
    super.key,
    this.enabled = true,
    this.caption = 'Koneksi internet anda terganggu !',
    this.child,
    this.bottomPadding = 0,
  });

  final bool enabled;
  final Widget? child;
  final String caption;
  final double bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(isConnectedProvider) == false;

    if (!enabled) {
      isShowOverlay = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    return DialogService(
                      title: Text('Informasi'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text('Kenapa koneksi internet saya terganggu?'),
                          OrderedList(
                            title: Text('Silahkan cek beberapa hal berikut ini :'),
                            children: [
                              Text('Pastikan perangkat anda tidak dalam mode pesawat.'),
                              Text('Pastikan anda terhubung dengan WiFi (Access Point) yang memiliki akses internet.'),
                              Text('Pastikan paket data anda, kuota dan masa berlakunya masih aktif.'),
                              Text('Pastikan sinyal WiFi atau sinyal provider bagus (diatas 2 bar).'),
                            ],
                          ),
                        ],
                      ),
                    ).showOk();
                  },
                  child: OverlayContainer(
                    isShowOverlay: isShowOverlay,
                    backgroundColor: oRed.withValues(alpha: .8),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            color: oWhite,
                          ),
                          10.width,
                          Text(caption).clr(oWhite),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
