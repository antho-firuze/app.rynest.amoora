// ignore_for_file: provider_parameters
import 'package:amoora/features/exchange_rate/controller/calculator_ctrl.dart';
import 'package:amoora/features/exchange_rate/views/widgets/info_exchange.dart';
import 'package:amoora/features/exchange_rate/views/widgets/monitor.dart';
import 'package:amoora/features/exchange_rate/views/widgets/numpad.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeRateView extends ConsumerStatefulWidget {
  const ExchangeRateView({super.key});

  static const routeName = '/exchange_rate';

  @override
  ConsumerState<ExchangeRateView> createState() => _ExchangeRateViewState();
}

class _ExchangeRateViewState extends ConsumerState<ExchangeRateView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(calcCtrl).clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Konversi Mata Uang')),
        body: context.isLandscape()
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: Column(
                        children: [
                          // MONITOR
                          Monitor(),
                          // INFO
                          InfoExchange(),
                        ],
                      ),
                    ),
                  ),
                  // NUMPAD
                  SizedBox(
                    width: context.screenWidthRatio(1, .4),
                    // height: 300,
                    child: const Numpad(),
                  ),
                ],
              )
            : Column(
                children: [
                  // MONITOR
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 4),
                    child: Monitor(),
                  ),
                  // INFO
                  InfoExchange(),
                  // NUMPAD
                  Flexible(
                    child: Numpad(),
                  ),
                  // ref.watch(fetchKursProvider).when(data: (data) => Text('Finish'), error: (error, stackTrace) => Container(), loading: () => Skelton(),),
                ],
              ),
      ),
    );
  }
}
