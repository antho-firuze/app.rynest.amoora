import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/notification/controller/notification_ctrl.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/features/user/controller/carousel_ctrl.dart';
import 'package:amoora/features/user/views/home/widgets/home_app_bar.dart';
import 'package:amoora/features/user/views/home/widgets/menu_list.dart';
import 'package:amoora/features/user/views/home/widgets/carousel_page.dart';
import 'package:amoora/features/user/views/home/widgets/info_prayer_times.dart';
import 'package:amoora/features/user/views/home/widgets/info_qibla_direction.dart';
import 'package:amoora/features/user/views/home/widgets/info_clock.dart';
import 'package:amoora/features/user/views/home/widgets/info_location.dart';
import 'package:amoora/features/user/views/menu_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!ref.read(allowNotificationProvider)) {
        await ref.read(permissionServiceProvider).requestNotificationPermission();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log('HomeView : Resumed');
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref.read(locationCtrlProvider).checkGpsEnabled();
        await ref.read(locationCtrlProvider).checkGpsPermission();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Column(
          children: [
            // Toolbar
            const HomeAppBar(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.refresh(fetchCarouselProvider);
                  ref.refresh(fetchProductsProvider);
                  ref.refresh(fetchPrayerTimesProvider);
                  ref.refresh(checkDataAvailableStreamProvider);
                },
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      // BACKGROUND
                      Opacity(
                        opacity: 0.5,
                        child: ClipPath(
                          clipper: SmileClipper(),
                          child: Container(
                            height: context.screenHeight * 0.5,
                            color: primaryLight,
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: SmileClipper(),
                        child: Container(
                          height: context.screenHeight * 0.5 - 10,
                          color: primaryLight,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ====================================== LOCATION & TIME
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 10, 16, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InfoLocation(),
                                Spacer(),
                                InfoClock(),
                              ],
                            ),
                          ),
                          // CAROUSEL IMAGE
                          15.height,
                          const CarouselPage(),
                          // ====================================== QIBLA & PRAYER SCHEDULE
                          15.height,
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SizedBox(
                              height: 72,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 75,
                                    child: InfoQiblaDirection(),
                                  ),
                                  10.width,
                                  const Expanded(child: InfoPrayerTimes()),
                                ],
                              ),
                            ),
                          ),
                          // ====================================== APP MENU
                          20.height,
                          Consumer(
                            builder: (context, ref, child) {
                              ref.watch(authUserProvider);
                              final roleName = ref.read(authCtrlProvider).roleName;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Menu Aplikasi'.hardcoded).bold(),
                                            10.width,
                                            Text("($roleName)"),
                                          ],
                                        ),
                                        Text('Lihat Semua'.hardcoded)
                                            .link(color: oGold50, onTap: () => context.goto(page: const MenuView())),
                                      ],
                                    ),
                                  ),
                                  10.height,
                                  SizedBox(
                                    height: 105.whenLandscape(105),
                                    child: const MenuList(),
                                  ),
                                ],
                              );
                            },
                          ),
                          // ====================================== Product
                          // 20.height,
                          // Column(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 16, right: 16),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Expanded(child: Text('Paket Amoora Travel'.hardcoded).bold()),
                          //           Text('Lihat Semua'.hardcoded)
                          //               .link(color: oGold50, onTap: () => context.goto(page: const ProductView())),
                          //         ],
                          //       ),
                          //     ),
                          //     10.height,
                          //     const ProductList(),
                          //   ],
                          // ),
                          // Blog
                          // 20.height,
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16),
                          //   child: BlogList(),
                          // ),
                          // Bottom
                          60.height,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
