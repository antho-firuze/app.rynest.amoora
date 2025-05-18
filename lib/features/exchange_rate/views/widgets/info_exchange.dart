// ignore_for_file: provider_parameters

import 'package:amoora/common/widgets/button/custom_iconbutton.dart';
import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/exchange_rate/controller/exchange_rate_ctrl.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoExchange extends ConsumerWidget {
  const InfoExchange({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var date = ref.watch(currDateProvider);
    var code = ref.watch(exchangeCodeProvider);
    var rate = ref.watch(exchangeRateProvider);
    var baseCode = ref.watch(baseCodeProvider);
    var pattern = baseCode == 'IDR' ? '#,##0.##' : '#,##0.00000';
    var rateFmt = rate.toCurrency(suffix: baseCode, pattern: pattern);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomInkWell(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            onTap: () => launchUrl(
              mode: LaunchMode.externalApplication,
              Uri.parse('https://www.google.com/maps/search/money+changer'),
            ),
            child: Column(
              children: [
                const Icon(Icons.near_me_sharp, color: Colors.lightBlue),
                Text('Money\nChanger').size(12).height(.9).center(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ref.watch(fetchKursProvider).when(
                      skipLoadingOnRefresh: false,
                      data: (data) {
                        return Column(
                          children: [
                            Text(date.yMMMd()).clr(oGold50).bold(),
                            Text('1 $code = $rateFmt'),
                          ],
                        );
                      },
                      error: (error, stackTrace) {
                        debugPrint(error.toString());
                        return Container();
                      },
                      loading: () => CircularProgressIndicator.adaptive(),
                    ),
                10.width,
                CustomIconButton(
                  onPressed: () async => ref.refresh(fetchKursProvider),
                  icon: Icon(
                    SuperIcons.bx_refresh,
                    color: oWhite,
                  ),
                ),
              ],
            ),
          ),
          CustomInkWell(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ExchangeInfoDialog(),
              );
            },
            child: Column(
              children: [
                const Icon(Icons.info, color: Colors.lightBlue, size: 30),
                Text('Info').size(12).center(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExchangeInfoDialog extends StatelessWidget {
  const ExchangeInfoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      Uri.parse('https://www.bi.go.id/id/statistik/informasi-kurs/transaksi-bi/default.aspx'),
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
                Text('Nilai tukar berdasarkan acuan kurs Bank Indonesia').tsTitleM().center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
