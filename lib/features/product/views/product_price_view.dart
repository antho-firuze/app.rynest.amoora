import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/custom_rich_text.dart';
import 'package:amoora/common/widgets/forms/top_bottom.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/features/product/model/product.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPriceView extends ConsumerWidget {
  const ProductPriceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(totalPriceUmroh);
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return const DataFailed();
    }
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Pesan Paket'.hardcoded)),
        body: ListView(
          children: [
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBottom(
                    children: [
                      const Text('Nama Paket').tsTitleM(),
                      5.height,
                      Text(item.name).tsTitleL().bold(),
                    ],
                  ),
                  10.height,
                  TopBottom(
                    children: [
                      const Text('Paket Hari').tsTitleM(),
                      5.height,
                      Text('${item.duration} Hari').tsTitleL().bold(),
                    ],
                  ),
                  10.height,
                  TopBottom(
                    children: [
                      const Text('Keberangkatan').tsTitleM(),
                      5.height,
                      Text(item.departureDate?.yMMMMd() ?? '').tsTitleL().bold(),
                    ],
                  ),
                  10.height,
                  TopBottom(
                    children: [
                      const Text('Pilihan Kamar').tsTitleM(),
                      5.height,
                      OptionsPrice(
                        type: 'Double',
                        subtype: '(1 Kamar ber-2)',
                        price: item.doublePrice.toIDR(),
                        item: item,
                        qty: ref.watch(roomDoubleQty),
                        onAdded: () => ref.read(productCtrlProvider).calculate('double', 'add'),
                        onRemoved: () => ref.read(productCtrlProvider).calculate('double', 'remove'),
                      ),
                      5.height,
                      OptionsPrice(
                        type: 'Triple',
                        subtype: '(1 Kamar ber-3)',
                        price: item.triplePrice.toIDR(),
                        item: item,
                        qty: ref.watch(roomTripleQty),
                        onAdded: () => ref.read(productCtrlProvider).calculate('triple', 'add'),
                        onRemoved: () => ref.read(productCtrlProvider).calculate('triple', 'remove'),
                      ),
                      5.height,
                      OptionsPrice(
                        type: 'Quad',
                        subtype: '(1 Kamar ber-4)',
                        price: item.quadPrice.toIDR(),
                        item: item,
                        qty: ref.watch(roomQuadQty),
                        onAdded: () => ref.read(productCtrlProvider).calculate('quad', 'add'),
                        onRemoved: () => ref.read(productCtrlProvider).calculate('quad', 'remove'),
                      ),
                    ],
                  ),
                  20.height,
                  Text('Total : ${totalPrice.toIDR()}').tsTitleL().bold().clr(oRed50),
                  10.height,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ref.read(productCtrlProvider).bookingNow,
                      child: const Text('Selanjutnya'),
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

class OptionsPrice extends StatelessWidget {
  const OptionsPrice({
    super.key,
    required this.item,
    required this.type,
    required this.subtype,
    required this.price,
    this.qty = 0,
    this.onAdded,
    this.onRemoved,
  });

  final Product? item;
  final String type;
  final String subtype;
  final String price;
  final int qty;
  final Function()? onAdded;
  final Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: oBlack.whenDark(oWhite)!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: TextSpan(
              text: type,
              style: tsTitleM().bold(),
              children: [
                TextSpan(
                  text: ' $subtype',
                  style: tsTitleM(),
                ),
              ],
            ),
          ),
          3.height,
          CustomRichText(
            text: TextSpan(
              text: 'Harga : ',
              style: tsTitleM().bold(),
              children: [
                TextSpan(
                  text: price,
                  style: tsTitleL().bold().clr(oRed50),
                ),
                TextSpan(
                  text: '/Pax',
                  style: tsTitleM(),
                ),
              ],
            ),
          ),
          5.height,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(text: qty.toString()),
                  style: tsTitleM(),
                  textAlign: TextAlign.center,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixText: 'Jumlah ',
                    suffixText: ' Pax',
                  ),
                ),
              ),
              5.width,
              SizedBox(
                height: 45,
                child: ToggleButtons(
                  isSelected: const [true, true],
                  onPressed: (index) {
                    if (index == 0) onAdded!();
                    if (index == 1) onRemoved!();
                  },
                  selectedColor: oGold,
                  borderRadius: BorderRadius.circular(6),
                  children: [
                    Icon(Icons.add, color: primaryLight.whenDark(oGold)),
                    Icon(Icons.remove, color: primaryLight.whenDark(oGold)),
                  ],
                ),
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     CustomIconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.add,
              //         color: oWhite,
              //       ),
              //     ),
              //     CustomIconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.remove,
              //         color: oWhite,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
