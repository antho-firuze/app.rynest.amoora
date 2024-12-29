import 'dart:developer';

import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/model/chapter.dart';
import 'package:amoora/features/quran2/views/chapter_view.dart';
import 'package:amoora/utils/custom_range_text_input_formatter.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';

final isValidProvider = StateProvider<bool>((ref) => false);

class GotoDialog extends ConsumerStatefulWidget {
  const GotoDialog({
    super.key,
    this.chapterId = 1,
    this.verseNum = 1,
  });

  final int chapterId;
  final int verseNum;

  @override
  ConsumerState<GotoDialog> createState() => _GotoDialogState();
}

class _GotoDialogState extends ConsumerState<GotoDialog> {
  List<Chapter> chapters = [];
  Chapter chapter = Chapter();

  @override
  void initState() {
    log("init state goto", name: "GOTO");
    chapters = ref.read(quranCtrlProvider).chapters;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gotoChapterIdProvider.notifier).state = widget.chapterId;
      ref.read(gotoVerseNumProvider.notifier).state = 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Build goto", name: "GOTO");
    chapter = ref.read(quranCtrlProvider).getChapter(ref.read(gotoChapterIdProvider));

    return CustomDialog(
      leading: const Icon(SuperIcons.is_polygon_matic_outline, color: oBlack),
      title: const Text('Pergi ke Surah').tsTitleL(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SELECT CHAPTER
          DropdownButton(
            items: List.generate(
              chapters.length,
              (index) => DropdownMenuItem(
                value: chapters[index].id,
                child: Text("${chapters[index].id}. ${chapters[index].name}"),
              ),
            ),
            value: ref.watch(gotoChapterIdProvider),
            onChanged: (value) {
              ref.read(gotoChapterIdProvider.notifier).state = value!;
              ref.read(gotoVerseNumProvider.notifier).state = 1;
            },
          ),
          5.height,
          Text('Masukkan nomor ayat antara 1-${chapter.verses!.length}'),
          10.height,
          // SELECT VERSE
          CustomInput(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            showCaptionFromHint: false,
            hintText: "1-${chapter.verses!.length}",
            onChanged: (val) {
              log("onChanged-Input : $val", name: "GOTO");
              ref.read(gotoVerseNumProvider.notifier).state = int.tryParse(val) ?? 0;
            },
            formatter: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              CustomRangeTextInputFormatter(minVal: 1, maxVal: chapter.verses!.length),
            ],
          ),
        ],
      ),
      actions: [
        CustomButton(
          child: const Text('BATAL'),
          onPressed: () => context.popz(),
        ),
        CustomButton(
          onPressed: () async {
            final chapterId = ref.read(gotoChapterIdProvider);
            final verseNum = ref.read(gotoVerseNumProvider) <= 1 ? 0 : ref.read(gotoVerseNumProvider);
            log("goto page $chapterId:$verseNum", name: "GOTO");

            if (autoScrollCtrl.hasClients) {
              log("autoScrollCtrl.hasClients : true", name: "GOTO");
              await headerCarouselController.animateToPage(chapterId - 1);
              await contentCarouselController.animateToPage(chapterId - 1);

              await Future.delayed(const Duration(milliseconds: 400));
              await autoScrollCtrl.scrollToIndex(verseNum, preferPosition: AutoScrollPosition.begin);
              ref.read(chapterIdProvider.notifier).state = chapterId;
              ref.read(gotoVerseNumProvider.notifier).state = verseNum;
              if (context.mounted) context.popz();
              return;
            }

            log("autoScrollCtrl.hasClients : false", name: "GOTO");
            ref.read(chapterIdProvider.notifier).state = chapterId;
            ref.read(gotoVerseNumProvider.notifier).state = verseNum;
            await context.goto(page: const ChapterView());
            if (context.mounted) context.popz();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
