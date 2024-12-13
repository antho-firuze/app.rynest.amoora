import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora/common/widgets/fade_animation.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/auth/model/user.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class ProfileViewOld extends ConsumerStatefulWidget {
  const ProfileViewOld({super.key});

  @override
  ConsumerState<ProfileViewOld> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileViewOld> {
  late double _expandedHeight;
  late double _toolbarHeight;
  late GlobalKey<NestedScrollViewState> _nestedScrollViewState;
  Future<void>? scrollAnimate;

  late bool darkMode;
  late User? _currUser;

  final List<String> tabs = [
    'Profil',
    'Kontak',
    'Akademik',
    'Penghargaan',
    'Keorganisasian',
    'Dokumen',
  ];

  String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  double calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - _toolbarHeight) / (_expandedHeight - _toolbarHeight);
    if (expandRatio > 1.0) expandRatio = 1;
    if (expandRatio < 0.42) expandRatio = 0;
    return expandRatio;
  }

  bool onNotification(ScrollEndNotification notification) {
    final scrollViewState = _nestedScrollViewState.currentState;
    final outerController = scrollViewState!.outerController;

    if (scrollViewState.innerController.positions.last.pixels == 0 && !outerController.positions.last.atEdge) {
      final range = _expandedHeight - _toolbarHeight; // 144
      final snapOffset = (outerController.offset / range) > 0.55 ? range : 0.0;

      Future.microtask(() async {
        if (scrollAnimate != null) await scrollAnimate;
        scrollAnimate = outerController.animateTo(
          snapOffset,
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
        );
      });
    }

    return false;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) => [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: _expandedHeight,
            toolbarHeight: _toolbarHeight,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final expandRatio = calculateExpandRatio(constraints);
                final animation = AlwaysStoppedAnimation(expandRatio);

                return Stack(
                  children: [
                    // Background color, image or gradient
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue.shade100,
                    //   ),
                    // ),
                    // Expanded widget
                    Center(
                      child: FadeAnimation(
                        animation: animation,
                        isExpanded: true,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            // Center Title Big
                            Text(
                              'Profil Peserta',
                              textAlign: TextAlign.center,
                              style: tsHeadlineL(),
                            ),
                            // Login UI
                            if (_currUser != null)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  5.height,
                                  // Avatar Image
                                  Center(
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade500,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  5.height,
                                  // Name & Contry
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jongkon Maremis',
                                        style: tsBodyL(),
                                      ),
                                      5.width,
                                      Text(
                                        countryCodeToEmoji('ID'),
                                        style: tsHeadlineM(),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                  // NIM / NISN
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'NIM / NISN: ',
                                        style: tsBodyL().clr(primaryLight),
                                      ),
                                      Text(
                                        '1234-5678-9012-3456',
                                        style: tsBodyL().clr(primaryLight).copyWith(
                                              letterSpacing: 2,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Collapsed widget
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: _toolbarHeight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Leading Icon
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(Icons.menu),
                            // ),
                            // Collapsed widget / small name
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: FadeAnimation(
                                animation: animation,
                                isExpanded: false,
                                child: Text(
                                  'Profil',
                                  style: tsHeadlineM(),
                                ),
                              ),
                            ),
                            // Actions widget
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ];

  Widget body() => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Builder(
          builder: (BuildContext context) => CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              // Menu when user has login
              if (_currUser != null)
                SliverToBoxAdapter(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          'Profil'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text(
                          'Kontak'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.school),
                        title: Text(
                          'Akademik'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.auto_awesome),
                        title: Text(
                          'Penghargaan'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.people),
                        title: Text(
                          'Keorganisasian'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.auto_stories),
                        title: Text(
                          'Dokumen'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

              // menu where user not login
              if (_currUser == null)
                SliverToBoxAdapter(
                  child: ListTile(
                    leading: const Icon(Icons.login),
                    title: Text(
                      'Sign In'.hardcoded,
                      style: tsTitleL(),
                    ),
                    onTap: () => context.push('/signin'),
                  ),
                ),

              SliverToBoxAdapter(child: divider()),
              // Pengaturan
              SliverToBoxAdapter(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.brightness_4),
                      title: Text(
                        'Mode Gelap'.hardcoded,
                        style: tsTitleL(),
                      ),
                      // trailing: Switch(
                      //   value: darkMode,
                      //   onChanged: (val) {},
                      // ),
                      onTap: () {},
                    ),
                    if (_currUser != null)
                      ListTile(
                        leading: const Icon(Icons.password),
                        title: Text(
                          'Rubah Kode Sandi'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () => context.push('/pwd_change'),
                      ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(
                        'Pengaturan'.hardcoded,
                        style: tsTitleL(),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.question_mark),
                      title: Text(
                        'Tentang Aplikasi'.hardcoded,
                        style: tsTitleL(),
                      ),
                      onTap: () => context.push('/about'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.directions_walk),
                      title: Text(
                        'Tampilkan Walkthrough Page'.hardcoded,
                        style: tsTitleL(),
                      ),
                      onTap: () => context.push('/walkthrough'),
                    ),
                  ],
                ),
              ),
              // Logout
              if (_currUser != null) ...[
                SliverToBoxAdapter(child: divider()),
                SliverToBoxAdapter(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text(
                          'Log out'.hardcoded,
                          style: tsTitleL(),
                        ),
                        onTap: () async {
                          AlertService.show(
                            title: 'Konfirmasi',
                            body: 'Anda ingin logout?',
                            onNo: () => context.pop(),
                            onOk: () {
                              // ref.read(authCtrl2Provider.notifier).onSignOut();
                            },
                            // context: context,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
              // Version
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70,
                  child: Center(
                    child: Text(
                      'Version 1.0',
                      style: tsTitleL(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    _nestedScrollViewState = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight = 250;
    _toolbarHeight = kToolbarHeight;
    _currUser = ref.watch(authUserProvider);

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: NotificationListener<ScrollEndNotification>(
          onNotification: onNotification,
          child: NestedScrollView(
            key: _nestedScrollViewState,
            headerSliverBuilder: headerSliverBuilder,
            body: body(),
          ),
        ),
      ),
    );
  }

  Widget getContactTabUI() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            key: UniqueKey(),
            slivers: [
              SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      title: Text('Urut. $index'),
                    ),
                    childCount: 5,
                  ),
                  itemExtent: 48,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget getAcademicTabUI() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            key: UniqueKey(),
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              const SliverToBoxAdapter(
                child: Text('Academic'),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.all(8),
              //   sliver: SliverFixedExtentList(
              //     delegate: SliverChildBuilderDelegate(
              //       (context, index) => ListTile(
              //         title: Text('Urut. $index'),
              //       ),
              //       childCount: 5,
              //     ),
              //     itemExtent: 48,
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  Widget getProfileTabUI() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            key: UniqueKey(),
            slivers: [
              SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      title: Text('No. $index'),
                    ),
                    childCount: 20,
                  ),
                  itemExtent: 48,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
