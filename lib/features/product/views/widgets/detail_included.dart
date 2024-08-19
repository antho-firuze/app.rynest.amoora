import 'package:amoora/features/product/controller/product_controller.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailIncluded extends ConsumerWidget {
  const DetailIncluded({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Termasuk'.hardcoded).tsHeadlineS().bold(),
          divider(padding: const EdgeInsets.symmetric(vertical: 5)),
          10.height,
          HtmlWidget(item.included),
        ],
      ),
    );
  }
}
