import 'dart:io';

import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/cross_paint.dart';
import 'package:amoora/common/widgets/custom_interactive_viewer.dart';
import 'package:amoora/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_controller.dart';
import 'package:amoora/features/product/views/itinerary_view.dart';
import 'package:amoora/features/product/views/widgets/detail_airlines.dart';
import 'package:amoora/features/product/views/widgets/detail_header.dart';
import 'package:amoora/features/product/views/widgets/detail_hotels.dart';
import 'package:amoora/features/product/views/widgets/detail_included.dart';
import 'package:amoora/features/product/views/widgets/detail_not_included.dart';
import 'package:amoora/features/product/views/widgets/detail_price.dart';
import 'package:amoora/features/product/views/widgets/detail_terms_conditions.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item?.id == null) {
      return const DataFailed();
    }

    final product = ref.watch(fetchProductProvider(item!.id!));
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          background: ref.watch(getImageProvider("${item.image}|${item.id}_${item.categoryName}")).when(
                data: (data) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: FileImage(File(data)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return SizedBox.expand(
                    child: CustomPaint(
                      painter: CrossPaint(color: oBlack50.withOpacity(.3)),
                      child: Center(
                        child: Text(
                          'Image Not Available',
                          textAlign: TextAlign.center,
                          style: tsCaption(),
                        ),
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
          expandedWidget: Text(
            item.name,
            style: tsHeadlineS().clr(oWhite),
            textAlign: TextAlign.center,
          ),
          collapsedWidget: Text(
            item.name,
            style: tsTitleL().clr(oWhite),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          actions: const [
            // FavoriteButton(
            //   isFavorite: item?.isFavorite ?? false,
            //   onPressed: ref.read(travelsProvider.notifier).toggleFavorite,
            // ),
            // ShareButton(),
          ],
          onRefresh: () async => await ref.read(productCtrlProvider).refreshDetail(),
          sliverList: product.when(
            data: (data) => SliverList.list(
              children: [
                Container(
                  color: primaryLight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                      child: Text(item.categoryName.toUpperCase()).tsHeadlineS().bold().clr(oWhite),
                    ),
                  ),
                ),
                10.height,
                const DetailHeader(),
                15.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              child: const Text('Lihat Itineraries'),
                              onPressed: () => context.goto(page: const ItineraryView()),
                            ),
                            CustomButton(
                              child: const Text('Lihat Banner'),
                              onPressed: () => context.goto(
                                page: ref.watch(getImageProvider("${item.image}|${item.id}_${item.categoryName}")).when(
                                      data: (data) => CustomInteractiveViewer(child: Image.file(File(data))),
                                      error: (error, stackTrace) => Container(),
                                      loading: () => const Center(child: CircularProgressIndicator()),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                15.height,
                const DetailIncluded(),
                15.height,
                const DetailNotIncluded(),
                15.height,
                const DetailTermsConditions(),
                15.height,
                const DetailAirlines(),
                15.height,
                const DetailHotels(),
                // 15.height,
                // const BankAccount(),
                15.height,
                const DetailPrice(),
                15.height,
              ],
            ),
            error: (error, stackTrace) => SliverList.list(
              children: const [DataFailed()],
            ),
            loading: () => SliverList.list(
              children: const [LinearProgressIndicator()],
            ),
          ),
        ),
      ),
    );
  }
}
