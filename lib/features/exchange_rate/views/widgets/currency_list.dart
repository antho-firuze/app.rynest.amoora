import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/features/exchange_rate/service/calculator_service.dart';
import 'package:amoora/features/exchange_rate/service/exchange_rate_service.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrencyList extends ConsumerWidget {
  const CurrencyList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ganti Mata Uang',
                  style: tsTitleL().bold(),
                ),
                20.height,
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ExchangeRateService.currCode.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3.whenLandscape(5)!.toInt(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .75,
                    // childAspectRatio: 1.3.whenLandscape(1.17),
                  ),
                  itemBuilder: (context, index) {
                    var code = ExchangeRateService.currCode[index];
                    return CustomInkWell(
                      onTap: () async {
                        await ref.read(exchangeRateSvc).fetchRateByCurrency(code);
                        ref.read(calcSvc).equal();
                        // ignore: use_build_context_synchronously
                        context.pop();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/currency/round-country-flag-${code.toLowerCase()}.png',
                          ),
                          2.height,
                          Text(
                            code.toUpperCase(),
                            style: tsTitleM().bold(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                10.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
