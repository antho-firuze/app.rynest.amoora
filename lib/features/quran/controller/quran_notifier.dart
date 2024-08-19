
import 'package:amoora/features/quran/controller/bookmark_controller.dart';
import 'package:amoora/features/quran/controller/quran_experience.dart';
import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/model/quran.dart';
import 'package:amoora/features/quran/repository/page_data.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quranCarouselController = CarouselSliderController();
// final quranFileReadyProvider = FutureProvider<bool>((ref) async {
//   return await ref
//       .read(quranServiceProvider)
//       .checkQuranFileExists()
//       .then((value) => true)
//       .onError((error, stackTrace) async {
//     if (!ref.watch(isConnectedProvider)) {
//       log('Jaringan internet bermasalah !');
//       return Future.error('Jaringan internet bermasalah !');
//     }

//     bool isRepoSiteAvailable = await ref.read(quranServiceProvider).checkRepoSiteAvailable();
//     if (!isRepoSiteAvailable) {
//       log('Repositori site not available !');
//       return Future.error('Repositori site not available !');
//     }

//     bool isRepoFileAvailable = await ref.read(quranServiceProvider).checkRepoFileAvailable();
//     if (!isRepoFileAvailable) {
//       log('Repositori file not available !');
//       return Future.error('Repositori file not available !');
//     }

//     log(error.toString());
//     return Future.error(error!);
//   });
// });

class QuranNotifier extends Notifier<Quran> {
  static const _pageKey = 'QURAN_CURRENT_PAGE_KEY';
  // static const _langKey = 'QURAN_LANGUAGE_KEY';

  @override
  Quran build() {
    // print('Build Quran Controller');
    state = Quran(
      page: ref.read(sharedPrefProvider).getInt(_pageKey) ?? 1,
    );

    // Always check hizb quarter for showing a toast, after getting page
    ref.read(quranToastProvider.notifier).update(hizbQuarter());

    return state.copyWith(
      surahNumber: surahNumber(),
      surahName: surahName(),
      juz: juz(),
      hizb: hizb(),
      hizbQuarter: hizbQuarter(),
      isRightPage: isRightPage(),
      hizbText: hizbText(),
      surahData: surahData(),
      isMarkPage: isMarkedPage(),
    );
  }

  // QURAN PAGE
  void changePage(int newIndex) {
    state = state.copyWith(
      page: newIndex + 1,
    );

    state = state.copyWith(
      surahNumber: surahNumber(),
      surahName: surahName(),
      juz: juz(),
      hizb: hizb(),
      hizbQuarter: hizbQuarter(),
      isRightPage: isRightPage(),
      hizbText: hizbText(),
      surahData: surahData(),
      isMarkPage: isMarkedPage(),
    );

    // Always check hizb quarter, for showing a toast
    ref.read(quranToastProvider.notifier).update(hizbQuarter());

    // Always save last page
    ref.read(sharedPrefProvider).setInt(_pageKey, newIndex + 1);
  }

  void gotoPage(int pageIndex) {
    quranCarouselController.jumpToPage(pageIndex);
    ref.read(quranOverlayProvider.notifier).toggle();
    ref.read(goRouterProvider).pop();
  }

  int surahNumber() => quranPages[state.page - 1].surah;

  String surahName() => getSurahNameArabic(surahNumber());

  int juz() => quranPages[state.page - 1].juz;

  int hizb() => quranPages[state.page - 1].hizb;

  int hizbQuarter() => quranPages[state.page - 1].hizbQuarter;

  bool isRightPage() => state.page % 2 != 0;

  String hizbText() => getHizbText(state.page);

  String surahData() => getSurahData(surahNumber());

  // QURAN BOOKMARK
  void updateMark(bool isMarked) => state = state.copyWith(isMarkPage: isMarked);

  bool isMarkedPage() => ref.watch(bookmarkCtrlProvider).contains(state.page.toString());

  void openScreen(String screen) async {
    await ref.read(goRouterProvider).push(screen);
    if (ref.watch(quranOverlayProvider)) {
      ref.read(quranOverlayProvider.notifier).toggle();
    }
  }

  // // QURAN LANGUAGE
  // String getLang() {
  //   lang = ref.read(sharedPreferencesProvider).getString(_langKey) ?? '';
  //   return lang;
  // }
}

final quranNotifierProvider = NotifierProvider<QuranNotifier, Quran>(QuranNotifier.new);
