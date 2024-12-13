import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailHeader extends ConsumerWidget {
  const DetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return const DataFailed();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name).tsHeadlineS().bold(),
          divider(padding: const EdgeInsets.symmetric(vertical: 5)),
          10.height,
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Column(
              children: [
                FieldList(
                  caption: const Text('Keberangkatan').tsBodyL(),
                  value: Text('${item.departureDate?.yMMMMd()}').tsBodyL().right().bold(),
                ),
                FieldList(
                  caption: const Text('Paket Perjalanan').tsBodyL(),
                  value: Text('${item.duration} Hari').tsBodyL().right().bold(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
