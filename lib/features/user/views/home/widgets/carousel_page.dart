import 'dart:io';

import 'package:amoora/common/exceptions/image_failed.dart';
import 'package:amoora/common/exceptions/loading_failed.dart';
import 'package:amoora/common/widgets/custom_interactive_viewer.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/user/controller/carousel_controller.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:amoora/utils/responsive_screen.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends ConsumerWidget {
  const CarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchCarouselProvider).when(
          skipLoadingOnRefresh: false,
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => LoadingFailed(onTap: () => ref.refresh(fetchCarouselProvider)),
          data: (data) {
            if (data.isEmpty) return ImageFailed(onTap: () => ref.refresh(fetchCarouselProvider));

            return ResponsiveScreen(
              largeScreen: SizedBox(
                height: context.screenHeight * 0.35,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CarouselSlider(
                        carouselController: homeCarouselController,
                        options: CarouselOptions(
                          height: context.screenHeight * 0.3,
                          enlargeFactor: .3,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {},
                        ),
                        items: List.generate(data.length, (index) {
                          final item = data[index];
                          return GestureDetector(
                            onTap: () => context.goto(
                                page: ref.watch(getImageProvider("${item.image}|carousel_${item.id}")).when(
                                      data: (data) => CustomInteractiveViewer(
                                        child: Image.file(File(data)),
                                      ),
                                      error: (error, stackTrace) => Container(),
                                      loading: () => const Center(child: CircularProgressIndicator()),
                                    )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ref.watch(getImageProvider("${item.image}|carousel_${item.id}")).when(
                                    skipLoadingOnRefresh: false,
                                    error: (error, stackTrace) => ImageFailed(
                                      foregroundColor: oWhite70,
                                      onTap: () => ref.refresh(getImageProvider("${item.image}|carousel_${item.id}")),
                                    ),
                                    loading: () => const Center(child: CircularProgressIndicator()),
                                    data: (data) {
                                      return Container(
                                        color: Colors.transparent,
                                        child: Image.file(
                                          File(data),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // 10.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        future: homeCarouselController.onReady,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done ||
                              homeCarouselController.state!.pageController != null) {
                            return SmoothPageIndicator(
                              controller: homeCarouselController.state!.pageController!,
                              count: homeCarouselController.state!.itemCount!,
                              onDotClicked: (index) => homeCarouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              ),
                              effect: const SlideEffect(
                                activeDotColor: oWhite,
                                dotColor: oGrey70,
                                dotWidth: 8,
                                dotHeight: 8,
                                type: SlideType.slideUnder,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    // 10.height,
                  ],
                ),
              ),
              child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CarouselSlider(
                        carouselController: homeCarouselController,
                        options: CarouselOptions(
                          height: 230.whenLandscape(230),
                          enlargeFactor: .3.whenLandscape(.2)!,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {},
                        ),
                        items: List.generate(data.length, (index) {
                          final item = data[index];
                          return GestureDetector(
                            onTap: () => context.goto(
                                page: ref.watch(getImageProvider("${item.image}|carousel_${item.id}")).when(
                                      data: (data) => CustomInteractiveViewer(
                                        child: Image.file(File(data)),
                                      ),
                                      error: (error, stackTrace) => Container(),
                                      loading: () => const Center(child: CircularProgressIndicator()),
                                    )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ref.watch(getImageProvider("${item.image}|carousel_${item.id}")).when(
                                    skipLoadingOnRefresh: false,
                                    error: (error, stackTrace) => ImageFailed(
                                      foregroundColor: oWhite70,
                                      onTap: () => ref.refresh(getImageProvider("${item.image}|carousel_${item.id}")),
                                    ),
                                    loading: () => const Center(child: CircularProgressIndicator()),
                                    data: (data) {
                                      return Container(
                                        color: Colors.transparent,
                                        child: Image.file(
                                          File(data),
                                          fit: context.isLandscape() ? BoxFit.fitWidth : BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // 10.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        future: homeCarouselController.onReady,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done ||
                              homeCarouselController.state!.pageController != null) {
                            return SmoothPageIndicator(
                              controller: homeCarouselController.state!.pageController!,
                              count: homeCarouselController.state!.itemCount!,
                              onDotClicked: (index) => homeCarouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              ),
                              effect: const SlideEffect(
                                activeDotColor: oWhite,
                                dotColor: oGrey70,
                                dotWidth: 8,
                                dotHeight: 8,
                                type: SlideType.slideUnder,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    // 10.height,
                  ],
                ),
              ),
            );
          },
        );
  }
}
