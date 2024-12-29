import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/model/chapter.dart';
import 'package:amoora/features/quran2/model/verse.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChapterHeader extends ConsumerWidget {
  const ChapterHeader({
    super.key,
    required this.chapter,
    required this.verse, 
  });

  final Chapter chapter;
  final Verse verse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader.builder(builder: (context, state) {
      if (state.isPinned) {
        if (verse.id != lastVerseId) {
          // log('verseIdCurr : $verseId');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(verseIdProvider.notifier).state = verse.id;
          });
          lastVerseId = verse.id;
        }
      }
      return AutoScrollTag(
        key: const ValueKey(0),
        controller: autoScrollCtrl,
        index: 0,
        child: Container(
          color: const Color(0xFFEBEBE9).whenDark(oBlack),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/quran/chapter-header.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    left: context.screenWidth / 7 - 11.whenLandscape(3)!,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 52.whenLandscape(65),
                        child: Text(chapter.revelationPlace)
                            .size(14.whenLandscape(18)!)
                            .clr(oBlack.whenDark(oWhite))
                            .bold()
                            .center(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: SizedBox(
                        width: 150.whenLandscape(250),
                        child: Text(chapter.translatedName?['name'] ?? '')
                            .size(16.whenLandscape(20)!)
                            .height(1)
                            .clr(oBlack.whenDark(oWhite))
                            .bold()
                            .center(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: context.screenWidth / 7 + 1.whenLandscape(10)!,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 25.whenLandscape(37),
                        child: Text("${chapter.versesCount}\nAyat")
                            .size(14.whenLandscape(18)!)
                            .height(.9)
                            .clr(oBlack.whenDark(oWhite))
                            .bold()
                            .center(),
                      ),
                    ),
                  ),
                ],
              ),
              if (chapter.bismillahPre) ...[
                5.height,
                Image.asset(
                  'assets/images/quran/im_basmallah3.png',
                  fit: BoxFit.cover,
                  color: oBlack.whenDark(oWhite),
                  height: 45,
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
