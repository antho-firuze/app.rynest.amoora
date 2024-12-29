import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/features/exchange_rate/service/calculator_service.dart';
import 'package:amoora/features/exchange_rate/service/exchange_rate_service.dart';
import 'package:amoora/features/exchange_rate/views/widgets/currency_list.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Monitor extends ConsumerWidget {
  const Monitor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MonitorBox(
          code: ref.watch(currExchangeCode),
          valueInput: ref.watch(inputValue),
          valueOutput: ref.watch(outputValue),
          onTap: () async => await selectCurrency(context),
        ),
        MonitorBox(
          code: ref.watch(currExchangeBaseCode),
          valueInput: ref.watch(exchangeValue),
        ),
      ],
    );
  }

  Future<dynamic> selectCurrency(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const CurrencyList(),
    );
  }
}

class MonitorBox extends StatelessWidget {
  const MonitorBox({
    super.key,
    required this.code,
    required this.valueInput,
    this.valueOutput,
    this.onTap,
  });

  final String code;
  final String valueInput;
  final String? valueOutput;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
        child: Row(
          children: [
            CustomInkWell(
              onTap: onTap,
              child: SizedBox(
                width: 40,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/currency/round-country-flag-${code.toLowerCase()}.png',
                      width: 30,
                    ),
                    Text(
                      code.toUpperCase(),
                      style: ts.bold(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    valueInput,
                    style: tsHeadlineDS(),
                    textAlign: TextAlign.right,
                  ),
                  if (valueOutput != null && valueOutput!.isNotEmpty && valueOutput != '0')
                    Text(
                      valueOutput ?? '',
                      style: tsHeadlineS(),
                      textAlign: TextAlign.right,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
