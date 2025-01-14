import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/features/exchange_rate/controller/exchange_rate_ctrl.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrencyListDialog extends ConsumerWidget {
  const CurrencyListDialog({
    super.key,
    this.onSelected,
  });

  final Function(String code)? onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDialog(
      title: Text('Ganti Mata Uang').tsTitleL().bold(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(CurrencyCode.values.length, (index) {
          var item = CurrencyCode.values[index];
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: CustomInkWell(
                onTap: () {
                  if (onSelected != null) onSelected!(item.code);
                  context.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Image.asset(item.image),
                      ),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.code).tsTitleM().bold(),
                          Text(item.desc).tsTitleM(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
      actions: [
        CustomButton(
          child: const Text('BATAL'),
          onPressed: () => context.pop(),
        ),
      ],
    );
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Material(
    //       borderRadius: BorderRadius.circular(10),
    //       child: Container(
    //         padding: const EdgeInsets.all(16),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text('Ganti Mata Uang').tsTitleL().bold(),
    //             20.height,
    //             GridView.builder(
    //               shrinkWrap: true,
    //               padding: const EdgeInsets.symmetric(horizontal: 10),
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemCount: currCode.length,
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 3.whenLandscape(5)!.toInt(),
    //                 mainAxisSpacing: 16,
    //                 crossAxisSpacing: 16,
    //                 childAspectRatio: .75,
    //                 // childAspectRatio: 1.3.whenLandscape(1.17),
    //               ),
    //               itemBuilder: (context, index) {
    //                 var code = currCode[index];
    //                 return CustomInkWell(
    //                   onTap: () {
    //                     if (onSelected != null) onSelected!(code);
    //                     context.pop();
    //                   },
    //                   child: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Image.asset('assets/icons/currency/round-country-flag-${code.toLowerCase()}.png'),
    //                       2.height,
    //                       Text(code.toUpperCase()).tsTitleM().bold(),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //             10.height,
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
