import 'package:amoora/features/agenda/views/agenda_view.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/exchange_rate/views/exchange_rate_view.dart';
import 'package:amoora/features/jelajah/views/jelajah_view.dart';
import 'package:amoora/features/live_location/views/live_map_view.dart';
import 'package:amoora/features/live_streaming/views/audience_view.dart';
import 'package:amoora/features/live_streaming/views/presenter_view.dart';
import 'package:amoora/features/prayer_times/views/prayer_times_view.dart';
import 'package:amoora/features/prayers/views/prayers_view.dart';
import 'package:amoora/features/qibla/view/qibla_view.dart';
import 'package:amoora/features/quran/views/home_quran_view.dart';
import 'package:amoora/features/user/model/app_menu.dart';
import 'package:amoora/core/app_asset.dart';
import 'package:amoora/features/user/service/menu_service.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCtrl {
  Ref ref;
  MenuCtrl(this.ref);

  List<AppMenu> getHomeAppMenus() {
    List<Map<String, Object>> appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    if (ref.read(authUserProvider) == null) {
      final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes"];
      appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
      return appMenus;
    }

    // AFTER SIGNIN
    appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE DEFAULT == TRUE
    appMenus.removeWhere((element) => element.isDefault == false);

    return appMenus;
  }

  List<AppMenu> getAllAppMenus() {
    final appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    if (ref.read(authUserProvider) == null) {
      final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes", "exchangeRate", "qibla"];
      appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
      return appMenus;
    }

    // AFTER SIGNIN
    appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE SHOW == TRUE
    appMenus.where((element) => element.isShow == true).toList();

    return appMenus;
  }

  List<AppMenu> _filterMenuByRole(List<AppMenu> menus) {
    // Role 1 => Jama'ah
    if (ref.read(authUserProvider)?.roleId == 1) {
      menus.removeWhere((element) => element.code == 'liveLocation');
      menus.removeWhere((element) => element.code == 'presenter');
      menus.removeWhere((element) => element.code == 'agenda');
    }
    // Role 2 => Muthowwif
    if (ref.read(authUserProvider)?.roleId == 2) {
      menus.removeWhere((element) => element.code == 'listener');
    }
    return menus;
  }

  String getIconPath(String code) {
    return switch (code) {
      "quran" => AppAsset.icQuran,
      "qibla" => AppAsset.icQibla,
      "prayerTimes" => AppAsset.icPrayerTimes,
      "prayers" => AppAsset.icPrayers,
      "agenda" => AppAsset.icAgenda,
      "jelajah" => AppAsset.icExplore,
      "liveLocation" => AppAsset.icLiveLocation,
      "presenter" => AppAsset.icPresenter,
      "listener" => AppAsset.icListener,
      "exchangeRate" => AppAsset.icExchangeRate,
      String() => '',
    };
  }

  Future goto(String code) async {
    return switch (code) {
      "quran" => await ref.read(pageUtilsProvider).goto(page: const HomeQuranView()),
      "qibla" => await ref.read(pageUtilsProvider).goto(page: const QiblaView()),
      "prayerTimes" => await ref.read(pageUtilsProvider).goto(page: const PrayerTimesView()),
      "prayers" => await ref.read(pageUtilsProvider).goto(page: const PrayersView()),
      "agenda" => await ref.read(pageUtilsProvider).goto(page: const AgendaView()),
      "jelajah" => await ref.read(pageUtilsProvider).goto(page: const JelajahView()),
      "liveLocation" => await ref.read(authCtrlProvider).signInGoto(page: const LiveMapView()),
      "presenter" =>await ref.read(authCtrlProvider).signInGoto(page: const PresenterView()),
      "listener" =>await ref.read(authCtrlProvider).signInGoto(page: const AudienceView()),
      "exchangeRate" => await ref.read(pageUtilsProvider).goto(page: const ExchangeRateView()),
      String() => '',
    };
  }
}

final menuCtrlProvider = Provider(MenuCtrl.new);
