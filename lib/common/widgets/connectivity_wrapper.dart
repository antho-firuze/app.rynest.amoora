import 'package:amoora/common/controllers/network_controller.dart';
import 'package:amoora/common/widgets/overlay_container.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(isConnectedProvider) == false;

    return Stack(
      children: [
        child ?? const SizedBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OverlayContainer(
              isShowOverlay: isShowOverlay,
              backgroundColor: oRed.withOpacity(.8),
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
                    Text(
                      'Koneksi internet anda terganggu !',
                      style: ts.clr(oWhite),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
