// ignore_for_file: provider_parameters

import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/exchange_rate/controller/exchange_rate_ctrl.dart';
import 'package:amoora/features/exchange_rate/service/exchange_rate_service.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoExchange extends ConsumerWidget {
  const InfoExchange({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var date = ref.watch(currExchangeDate);
    var code = ref.watch(currExchangeCode);
    var baseCode = ref.watch(currExchangeBaseCode);
    var rate = ref.watch(currExchangeRate);
    var pattern = baseCode == 'IDR' ? '#,##0.##' : '#,##0.00000';
    var rateFmt = rate.toCurrency(suffix: baseCode, pattern: pattern);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomInkWell(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            onTap: ref.read(exchangeRateCtrl).openMaps,
            child: Column(
              children: [
                const Icon(
                  Icons.near_me_sharp,
                  color: Colors.lightBlue,
                ),
                Text(
                  'Money\nChanger',
                  style: ts.copyWith(fontSize: 12, height: .9),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomInkWell(
              onTap: () async => await ref.read(exchangeRateSvc).fetchRateByCurrency(),
              child: Column(
                children: [
                  Text(
                    date.yMMMd(),
                    style: ts.clr(oGold50).bold(),
                  ),
                  Text('1 $code = $rateFmt'),
                ],
              ),
            ),
          ),
          CustomInkWell(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: CustomInkWell(
                                  onTap: () => launchUrl(
                                    Uri.parse(
                                        'https://www.bi.go.id/id/statistik/informasi-kurs/transaksi-bi/default.aspx'),
                                    mode: LaunchMode.externalApplication,
                                    webOnlyWindowName: '_blank',
                                  ),
                                  child: Image.asset(
                                    'assets/images/bank-bi.png',
                                    width: context.screenWidthRatio(.7, .3),
                                  ),
                                ),
                              ),
                              5.height,
                              Text(
                                'Nilai tukar berdasarkan acuan kurs Bank Indonesia',
                                style: tsTitleM(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Column(
              children: [
                const Icon(
                  Icons.info,
                  color: Colors.lightBlue,
                  size: 30,
                ),
                Text(
                  'Info',
                  style: ts.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
