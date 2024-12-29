import 'dart:developer';

import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/views/quran_setting_view.dart';
import 'package:amoora/features/quran2/views/widgets/chapter_header.dart';
import 'package:amoora/features/quran2/views/widgets/goto_dialog.dart';
import 'package:amoora/features/quran2/views/widgets/verse_tile.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ChapterView extends ConsumerWidget {
  const ChapterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.read(quranCtrlProvider).chapters;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await autoScrollCtrl.scrollToIndex(ref.read(gotoVerseNumProvider)!, preferPosition: AutoScrollPosition.begin);
      },
    );

    WakelockPlus.enable();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        log('onPopInvoked', name: "CHAPTER-VIEW");
        ref.read(gotoVerseNumProvider.notifier).state = 0;
        WakelockPlus.disable();
        context.popz();
      },
      child: MyUI(
        showConnectivityInfo: false,
        child: Scaffold(
          appBar: AppBar(
            title: Consumer(
              builder: (context, ref, child) {
                final verseId = ref.watch(verseIdProvider);
                final juz = ref.read(quranCtrlProvider).getJuzId(verseId);
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Juz $juz"),
                    ],
                  ),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(SuperIcons.is_polygon_matic_outline),
                onPressed: () async => await showDialog(
                  context: context,
                  builder: (BuildContext context) => GotoDialog(
                    chapterId: ref.read(chapterIdProvider),
                  ),
                ),
              ),
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
                      initialPage: ref.read(chapterIdProvider) - 1,
                      viewportFraction: .4,
                      onPageChanged: (index, reason) {
                        log("onPageChanged => header index: $index", name: "CHAPTER-VIEW");

                        switch (reason) {
                          case CarouselPageChangedReason.timed:
                          case CarouselPageChangedReason.manual:
                            final page = index + 1;
                            ref.read(chapterIdProvider.notifier).state = page;
                            contentCarouselController.animateToPage(index);
                            return;
                          case CarouselPageChangedReason.controller:
                        }
                      },
                    ),
                    itemCount: chapters.length,
                    itemBuilder: (context, index, realIndex) {
                      return Consumer(
                        builder: (context, ref, child) {
                          bool currIndex = index == ref.watch(chapterIdProvider) - 1;
                          return GestureDetector(
                            onTap: () {
                              ref.read(chapterIdProvider.notifier).state = index + 1;
                              headerCarouselController.animateToPage(index);
                              contentCarouselController.animateToPage(index);
                            },
                            child: Text("${chapters[index].id}. ${chapters[index].name}")
                                .clr(currIndex ? oWhite : oGrey70),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  color: primaryDark,
                  child: CarouselSlider.builder(
                    carouselController: contentCarouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: double.infinity,
                      initialPage: ref.read(chapterIdProvider) - 1,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      reverse: true,
                      onPageChanged: (index, reason) {
                        log("onPageChanged => content index: $index", name: "CHAPTER-VIEW");

                        switch (reason) {
                          case CarouselPageChangedReason.timed:
                          case CarouselPageChangedReason.manual:
                            final page = index + 1;
                            ref.read(chapterIdProvider.notifier).state = page;
                            headerCarouselController.animateToPage(index);
                            return;
                          case CarouselPageChangedReason.controller:
                        }
                      },
                    ),
                    itemCount: chapters.length,
                    itemBuilder: (context, index, realIndex) {
                      final chapter = chapters[index];
                      final verses = chapter.verses!;
                      var versesList = [];
                      for (var verse in verses) {
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
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
