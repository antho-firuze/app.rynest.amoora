import 'dart:ui';

import 'package:amoora/common/controllers/splash_provider.dart';
import 'package:amoora/common/widgets/app_logo.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_asset.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/common/controllers/init_controller.dart';
import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routeName = '/splash';

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(initCtrlProvider).initApps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        body: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: SmileClipper(),
                child: Container(
                  height: context.screenHeight,
                  color: primaryLight,
                ),
              ),
            ),
            ClipPath(
              clipper: SmileClipper(),
              child: Container(
                height: context.screenHeight - 10,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: primaryLight,
                  image: DecorationImage(
                    image: AssetImage(AppAsset.imBackground1),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRect(
                        child: SizedBox(
                          height: context.screenHeight * .6,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child:
                                Container(color: Colors.black.withOpacity(0)),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: context.screenWidth * .7,
                                  child: const AppLogo(),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: context.screenWidth * .7 - 5,
                                  child: Image.asset(
                                    AppAsset.imLogo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.height,
                          Text(
                            'Umroh & Travel'.hardcoded,
                            style: tsTitleL().copyWith(
                              color: oGold50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          40.height,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.screenHeight * .05),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ref.watch(getVersionProvider).when(loading: () {
                  return const Skelton();
                }, error: (Object error, StackTrace stackTrace) {
                  return Container();
                }, data: (String data) {
                  return Text(
                    'Version $data',
                    style: tsTitleM().copyWith(color: primaryLight),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
