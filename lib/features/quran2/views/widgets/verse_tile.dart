import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_theme.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/model/chapter.dart';
import 'package:amoora/features/quran2/model/verse.dart';
import 'package:amoora/features/quran2/views/widgets/verse_bottom_sheet.dart';
import 'package:amoora/features/quran2/views/widgets/verse_no.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class VerseTile extends ConsumerWidget {
  const VerseTile({
    super.key,
    required this.chapter,
    required this.verse,
  });

  final Chapter chapter;
  final Verse verse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader.builder(
      overlapsContent: true,
      builder: (context, state) {
        if (state.isPinned) {
          if (verse.id != lastVerseId) {
            // log('verseIdCurr : $verse.id');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(verseIdProvider.notifier).state = verse.id;
            });
            lastVerseId = verse.id;
          }
        }
        return GestureDetector(
          onTap: () async => showModalBottomSheet(
            context: context,
            builder: (context) => VerseBottomSheet(chapter: chapter, verse: verse),
          ),
          child: AutoScrollTag(
            key: ValueKey(verse.number),
            controller: autoScrollCtrl,
            index: verse.number,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                child: VerseNo(verse.number),
              ),
            ),
          ),
        );
      },
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            color: verse.number % 2 == 1 ? const Color(0xFFEBEBE9).whenDark(oBlack) : oWhite.whenDark(oBlack),
            child: CustomInkWell(
              radius: 0,
              onTap: () async => showModalBottomSheet(
                context: context,
                builder: (context) => VerseBottomSheet(chapter: chapter, verse: verse),
              ),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 5, top: 5),
                    child: Text(verse.ar)
                        .size(ref.watch(arabicFontSizeProvider))
                        .family(AppTheme.secondaryFont)
                        .right()
                        .clr(oBlack.whenDark(oWhite)),
                    // child: CustomText(verseAr, fontSize: ref.watch(arabicFontSizeProvider)),
                  ),
                  10.height,
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (ref.watch(showLatinProvider)) ...[
                          Text(verse.tr).size(ref.watch(latinFontSizeProvider)).family('glyphs').clr(oGold300),
                          10.height,
                        ],
                        if (ref.watch(showTransProvider))
                          Text(verse.idn)
                              .size(ref.watch(transFontSizeProvider))
                              .family('glyphs')
                              .clr(oBlack.whenDark(oWhite)),
                      ],
                    ),
                  ),
                  15.height,
                ],
              ),
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }
}
