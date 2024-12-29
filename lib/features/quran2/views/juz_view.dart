import 'dart:developer';

import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/views/quran_setting_view.dart';
import 'package:amoora/features/quran2/views/widgets/chapter_header.dart';
import 'package:amoora/features/quran2/views/widgets/verse_tile.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final autoScrollCtrl = AutoScrollController();

class JuzView extends ConsumerWidget {
  const JuzView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzs = ref.read(quranCtrlProvider).juzs;

    // log('build surah view => ${ref.watch(chapterIdProvider)}:${verses![0].number}');

    WakelockPlus.enable();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        debugPrint('onPopInvoked');
        WakelockPlus.disable();
        context.pop();
      },
      child: MyUI(
        showConnectivityInfo: false,
        child: Scaffold(
          appBar: AppBar(
            title: Consumer(
              builder: (context, ref, child) {
                final verseId = ref.watch(verseIdProvider);
                final chapterId = ref.read(quranCtrlProvider).getChapterId(verseId);
                final chapterName = ref.read(quranCtrlProvider).getChapterName(chapterId);
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$chapterId. Surah $chapterName"),
                      // Text("Juz ${ref.watch(juzIdProvider)}"),
                    ],
                  ),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(SuperIcons.ev_settings_outline),
                onPressed: () async => await context.goto(page: const QuranSettingView()),
              ),
            ],
          ),
          body: Stack(
            children: [
              SizedBox(
                height: 25,
                width: double.infinity,
                child: Container(
                  color: primaryLight,
                  child: CarouselSlider.builder(
                    carouselController: headerCarouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      reverse: true,
                      enlargeCenterPage: false,
                      initialPage: ref.read(juzIdProvider) - 1,
                      viewportFraction: .4,
                      onPageChanged: (index, reason) {
                        log("onPageChanged => header index: $index", name: "JUZ-VIEW");

                        switch (reason) {
                          case CarouselPageChangedReason.timed:
                          case CarouselPageChangedReason.manual:
                            final page = index + 1;
                            ref.read(juzIdProvider.notifier).state = page;
                            contentCarouselController.animateToPage(index);
                            return;
                          case CarouselPageChangedReason.controller:
                        }
                      },
                    ),
                    itemCount: juzs.length,
                    itemBuilder: (context, index, realIndex) {
                      return Consumer(
                        builder: (context, ref, child) {
                          bool currIndex = index == ref.watch(juzIdProvider) - 1;
                          return GestureDetector(
                            onTap: () {
                              ref.read(juzIdProvider.notifier).state = index + 1;
                              headerCarouselController.animateToPage(index);
                              contentCarouselController.animateToPage(index);
                            },
                            child: Text("Juz ${index + 1}").clr(currIndex ? oWhite : oGrey70),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CarouselSlider.builder(
                    carouselController: contentCarouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: double.infinity,
                      initialPage: ref.read(juzIdProvider) - 1,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      reverse: true,
                      onPageChanged: (index, reason) {
                        log("onPageChanged => content index: $index", name: "JUZ-VIEW");

                        switch (reason) {
                          case CarouselPageChangedReason.timed:
                          case CarouselPageChangedReason.manual:
                            final page = index + 1;
                            ref.read(juzIdProvider.notifier).state = page;
                            headerCarouselController.animateToPage(index);
                            return;
                          case CarouselPageChangedReason.controller:
                        }
                      },
                    ),
                    itemCount: juzs.length,
                    itemBuilder: (context, index, realIndex) {
                      final juz = juzs[index];
                      final verses = ref.read(quranCtrlProvider).versesByJuz(juz.id);
                      var versesList = [];
                      for (var verse in verses) {
                        final chapter = ref.read(quranCtrlProvider).getChapter(verse.chapter);
                        if (verse.number == 1) {
                          versesList.add(ChapterHeader(chapter: chapter, verse: verse));
                          versesList.add(VerseTile(chapter: chapter, verse: verse));
                        } else {
                          versesList.add(VerseTile(chapter: chapter, verse: verse));
                        }
                      }

                      return CustomScrollView(
                        controller: autoScrollCtrl,
                        slivers: [
                          ...versesList.map((verse) => verse),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
