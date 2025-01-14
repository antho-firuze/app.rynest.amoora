import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/features/exchange_rate/controller/exchange_rate_ctrl.dart';
import 'package:amoora/features/exchange_rate/controller/calculator_ctrl.dart';
import 'package:amoora/features/exchange_rate/views/widgets/currency_list_dialog.dart';
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
          code: ref.watch(exchangeCodeProvider),
          valueInput: ref.watch(inputValue),
          valueOutput: ref.watch(outputValue),
          onTap: () async => await showDialog(
            context: context,
            builder: (context) => CurrencyListDialog(
              onSelected: (code) {
                ref.read(exchangeRateCtrl).getRateByCurrency(code);
                ref.read(calcCtrl).equal();
              },
            ),
          ),
        ),
        MonitorBox(
          code: ref.watch(baseCodeProvider),
          valueInput: ref.watch(exchangeValue),
        ),
      ],
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
                    Image.asset('assets/icons/currency/round-country-flag-${code.toLowerCase()}.png', width: 30),
                    Text(code.toUpperCase()).bold(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(valueInput).tsHeadlineDS().right(),
                  if (valueOutput != null && valueOutput!.isNotEmpty && valueOutput != '0')
                    Text(valueOutput ?? '').tsHeadlineS().right(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
