import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/features/product/views/product_detail_view.dart';
import 'package:amoora/features/product/views/widgets/card_vert_view.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductList extends ConsumerWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(fetchProductsProvider);
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: products.when(
        skipLoadingOnRefresh: false,
        error: (error, stackTrace) => DataFailed(onTap: () => ref.refresh(fetchProductsProvider)),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          if (data.isEmpty) {
            return DataFailed(onTap: () => ref.refresh(fetchProductsProvider));
          }
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 16),
            itemBuilder: (context, index) {
              final product = ref.watch(fetchProductProvider(data[index]));
              return product.when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  if (data == null) return const DataFailed();
                  return SizedBox(
                    width: 250,
                    child: CardVertView(
                      item: data,
                      onTap: () {
                        ref.read(selectedProductProvider.notifier).state = data;
                        return context.goto(page: const ProductDetailView());
                      },
                    ),
                  );
                },
                error: (error, stackTrace) => DataFailed(
                  onTap: () => ref.refresh(fetchProductProvider(data[index])),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
            separatorBuilder: (context, index) => 10.width,
            itemCount: data.length,
          );
        },
      ),
    );
  }
}
