import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/features/product/views/product_price_view.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPrice extends ConsumerWidget {
  const DetailPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga Mulai',
                        style: tsBodyL().bold(),
                      ),
                      Text(
                        item.quadPrice.toIDR(),
                        style: tsHeadlineM().bold().clr(oRed50),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(roomDoubleQty.notifier).state = 0;
                    ref.read(roomTripleQty.notifier).state = 0;
                    ref.read(roomQuadQty.notifier).state = 0;
                    ref.read(totalPriceUmroh.notifier).state = 0;
                    context.goto(page: const ProductPriceView());
                  },
                  child: const Text('Selanjutnya'),
                )
              ],
            ),
          ),
          // 5.height,
          // Tooltip(
          //   message: 'sisa ${item?.remainingSeat} seat',
          //   child: SizedBox(
          //     height: 20,
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(4),
          //       child: LiquidLinearProgressIndicator(
          //         value: item!.remainingSeat / item.totalSeat,
          //         valueColor: const AlwaysStoppedAnimation(Colors.cyan),
          //         backgroundColor: Colors.grey,
          //         center: Text(
          //           'sisa ${item.remainingSeat} kursi',
          //           style: tsBodyS().bold().clr(oWhite),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
