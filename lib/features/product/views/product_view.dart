import 'package:amoora/common/exceptions/data_exeception_layout.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/features/product/views/product_detail_view.dart';
import 'package:amoora/features/product/views/widgets/card_vert_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Semua Paket'.hardcoded)),
        body: RefreshIndicator(
          onRefresh: () async => await ref.refresh(fetchProductsProvider),
          child: ref.watch(fetchProductsProvider).when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  if (data.isEmpty) {
                    return DataExceptionLayout(
                      type: ExeceptionType.dataEmpty,
                      onTap: () => ref.refresh(fetchProductsProvider),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 10, left: 16, right: 14, top: 10),
                    separatorBuilder: (context, index) => 10.height,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final id = data[index];
                      return ref.watch(fetchProductProvider(id)).when(
                            skipLoadingOnRefresh: false,
                            data: (data) {
                              if (data == null) {
                                return DataExceptionLayout(
                                  type: ExeceptionType.dataEmpty,
                                  onTap: () => ref.refresh(fetchProductProvider(id)),
                                );
                              }
                              return CardVertView(
                                item: data,
                                onTap: () {
                                  ref.read(selectedProductProvider.notifier).state = data;
                                  return context.goto(page: const ProductDetailView());
                                },
                              );
                            },
                            error: (error, stackTrace) => DataExceptionLayout(
                              error: error,
                              onTap: () => ref.refresh(fetchProductProvider(id)),
                            ),
                            loading: () => const Center(child: CircularProgressIndicator()),
                          );
                    },
                  );
                },
                error: (error, stackTrace) => DataExceptionLayout(
                  error: error,
                  onTap: () => ref.refresh(fetchProductsProvider),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
