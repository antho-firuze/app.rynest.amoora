import 'package:amoora/common/controllers/walkthrough_ctrl.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/system_ui_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class WalkthroughView extends ConsumerStatefulWidget {
  const WalkthroughView({super.key});

  static const routeName = '/walkthrough';

  @override
  ConsumerState<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends ConsumerState<WalkthroughView> {
  PageController controller = PageController();
  PageController subController = PageController();
  bool isLastPage = false;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return MyUI(
      customUiOverlayStyle: SystemUIOverlay.transparentOverlay,
      enabledSafeArea: false,
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: SmileClipper(),
              child: Container(
                height: context.screenHeight * 0.6,
                color: primaryLight,
              ),
            ),
            ClipPath(
              clipper: SmileClipper(),
              child: Container(
                height: context.screenHeight * 0.6 - 15,
                alignment: Alignment.bottomCenter,
                child: PageView(
                  controller: subController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    walks.length,
                    (index) => Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/${walks[index]['image']}"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  subController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  indexPage = index;
                  setState(() => isLastPage = index == walks.length - 1);
                },
                children: List.generate(
                  walks.length,
                  (index) => BuildPage(
                    color: walks[index]['color'],
                    title: walks[index]['title'],
                    subTitle: walks[index]['subTitle'],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isLastPage)
                TextButton(
                  onPressed: () => controller.jumpToPage(walks.length),
                  child: Text(
                    'SKIP',
                    style: tsTitleM(),
                  ),
                )
              else
                50.width,
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  count: walks.length,
                ),
              ),
              isLastPage
                  ? ElevatedButton(
                      onPressed: ref.read(walkthroughCtrlProvider.notifier).getStarted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: tsButton().copyWith(color: oWhite),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () =>
                          controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        fixedSize: const Size(60, 60),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Icon(
                        Icons.navigate_next,
                        color: oWhite,
                        size: 40,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.color,
    this.urlImage,
    required this.title,
    required this.subTitle,
  });

  final Color color;
  final String? urlImage;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          20.height,
          // Image
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          10.height,
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: tsHeadlineL(),
          ),
          // Sub Title
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: tsTitleL(),
            ),
          ),
          20.height,
        ],
      ),
    );
  }
}
