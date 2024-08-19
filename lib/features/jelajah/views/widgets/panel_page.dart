import 'dart:developer';
import 'dart:io';

import 'package:amoora/common/exceptions/loading_failed.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/jelajah/controller/jelajah_controller.dart';
import 'package:amoora/features/jelajah/service/jelajah_service.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
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
    var places = ref.read(jelajahCtrlProvider).getPlaces();

    double borderRadius = 12;

    log('build | PanelPage', name: 'jelajah');
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: MyUI(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ListView(
              controller: sc,
              children: [
                15.height,
                Text('Berikut adalah tempat-tempat bersejarah yang berada di sekitar Kota Mekah & Madinah'.hardcoded)
                    .tsTitleM()
                    .center()
                    .bold(),
                15.height,
                StaggeredGrid.count(
                  crossAxisCount: context.isLandscape() ? 4 : 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(places.length, (index) {
                    final place = places[index];
                    return SizedBox(
                      // width: 140,
                      height: 100,
                      child: GestureDetector(
                        onTap: () => ref
                            .read(jelajahCtrlProvider)
                            .changeFocusPosition([place.lat, place.lng], 'markerId_${place.id}'),
                        onLongPress: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                          ),
                          builder: (context) => MyUI(
                            isTransparent: true,
                            child: ListView(
                              shrinkWrap: true,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                10.height,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CloseButton(onPressed: () => context.pop()),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return switch (index) {
                                      0 => ListTile(
                                          leading: const Icon(SuperIcons.mg_share_2_fill),
                                          title: const Text('Share To'),
                                          onTap: () => Share.shareUri(
                                            Uri.parse(
                                              'https://www.google.com/maps/search/?api=1&query=${place.lat}%2C${place.lng}&query_place_id=${place.id}',
                                            ),
                                          ),
                                        ),
                                      1 => ListTile(
                                          leading: const Icon(SuperIcons.is_send_2_outline),
                                          title: const Text('Direction'),
                                          onTap: () => launchUrl(
                                            mode: LaunchMode.externalApplication,
                                            Uri.parse(
                                              'https://www.google.com/maps/search/?api=1&query=${place.lat}%2C${place.lng}&query_place_id=${place.id}',
                                            ),
                                          ),
                                        ),
                                      int() => throw UnimplementedError(),
                                    };
                                  },
                                  separatorBuilder: (context, index) =>
                                      divider(padding: const EdgeInsets.only(left: 16)),
                                  itemCount: 2,
                                ),
                                12.height,
                              ],
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            ref.watch(getImageJelajahProvider(place.image!)).when(
                                  skipLoadingOnRefresh: false,
                                  error: (error, stackTrace) =>
                                      LoadingFailed(onTap: () => ref.refresh(getImageJelajahProvider(place.image!))),
                                  loading: () => const Center(child: CircularProgressIndicator()),
                                  data: (data) => Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(borderRadius),
                                        image: DecorationImage(
                                          image: FileImage(File(data)),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                                decoration: BoxDecoration(
                                  color: oWhite.withOpacity(.5).whenDark(oBlack.withOpacity(.5)),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(borderRadius),
                                    bottomRight: Radius.circular(borderRadius),
                                  ),
                                ),
                                child: Text('${place.name}').size(13).bold().center().clr(oBlack.whenDark(oWhite)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                12.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
