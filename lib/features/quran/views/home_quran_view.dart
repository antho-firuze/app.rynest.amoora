import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/quran_asset_controller.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/controller/quran_experience.dart';
import 'package:amoora/features/quran/repository/page_data.dart';
import 'package:amoora/features/quran/views/widgets/custom_toast.dart';
import 'package:amoora/features/quran/views/widgets/info_overlay.dart';
import 'package:amoora/features/quran/views/widgets/marker.dart';
import 'package:amoora/features/quran/views/widgets/page_number.dart';
import 'package:amoora/features/quran/views/widgets/quran_page.dart';
import 'package:amoora/features/quran/views/widgets/simple_page_info.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class HomeQuranView extends ConsumerWidget {
  const HomeQuranView({super.key});

  static const routeName = '/home_quran';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String quranAssetState = ref.watch(quranAssetStateProvider);
    double progress = ref.watch(progressProvider);

    if (quranAssetState == 'downloading' || quranAssetState == 'extracting') {
      return MyUI(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: oBlack50,
              ),
              Center(
                child: SizedBox(
                  width: context.screenWidth * .8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sedang mengunduh File Asset Al-Quran'.hardcoded),
                          20.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('On Progress'),
                              Text(quranAssetState),
                            ],
                          ),
                          5.height,
                          LinearProgressIndicator(
                            value: progress / 100,
                            valueColor: const AlwaysStoppedAnimation<Color>(oGold200),
                          ),
                          5.height,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (quranAssetState == 'error') {
      return MyUI(
        child: Scaffold(
          body: WarningException(
            title: ref.watch(quranAssetErrorProvider),
            child: ElevatedButton(
              onPressed: () async => await ref.read(quranAssetCtrlProvider).getFile(),
              child: Text('Ulangi Download File'.hardcoded),
            ),
          ),
        ),
      );
    }

    if (quranAssetState == 'file_not_exists') {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: const Text('Baca Al-Quran')),
          body: WarningException(
            title: "File Asset Al-Qur'an belum tersedia",
            child: ElevatedButton(
              onPressed: () async => await ref.read(quranAssetCtrlProvider).getFile(),
              child: Text('Download File Sekarang'.hardcoded),
            ),
          ),
        ),
      );
    }

    var quran = ref.watch(quranNotifierProvider);

    WakelockPlus.enable();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        debugPrint('onPopInvoked');
        if (ref.watch(quranOverlayProvider)) {
          ref.read(quranOverlayProvider.notifier).toggle();
        } else {
          WakelockPlus.disable();
          context.pop();
        }
      },
      child: MyUI(
        customUiOverlayStyle: ref.watch(quranOverlayProvider)
            ? SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
              )
            : SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: context.isDarkMode ? Brightness.dark : Brightness.light,
                statusBarIconBrightness: context.isDarkMode ? Brightness.dark : Brightness.light,
              ),
        enabledSafeArea: false,
        child: Scaffold(
          backgroundColor: context.colorBg,
          body: GestureDetector(
            onTap: ref.read(quranOverlayProvider.notifier).toggle,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: CarouselSlider.builder(
                      carouselController: quranCarouselController,
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: double.infinity,
                        initialPage: quran.page - 1,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        reverse: true,
                        onPageChanged: (int newPage, _) {
                          ref.read(quranNotifierProvider.notifier).changePage(newPage);
                        },
                      ),
                      itemCount: quranPages.length,
                      itemBuilder: (context, index, realIndex) => Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: context.isLandscape()
                            ? ListView(
                                children: [
                                  const SimplePageInfo(),
                                  QuranPage(pageIndex: index),
                                  const PageNumber(),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SimplePageInfo(),
                                  Expanded(child: QuranPage(pageIndex: index)),
                                  const PageNumber(),
                                ],
                              ),
                      ),
                    ),
                  ),
                  const Marker(),
                  const CustomToast(),
                  const InfoOverlay(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
