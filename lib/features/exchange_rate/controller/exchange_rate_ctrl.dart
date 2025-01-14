import 'dart:developer';

import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart' show parse;

enum CurrencyCode {
  sar('SAR', 'Riyad Saudi Arabia', 'assets/icons/currency/round-country-flag-sar.png'),
  usd('USD', 'Dolar Amerika Serikat', 'assets/icons/currency/round-country-flag-usd.png'),
  eur('EUR', 'EURO', 'assets/icons/currency/round-country-flag-eur.png'),
  myr('MYR', 'Ringgit Malaysia', 'assets/icons/currency/round-country-flag-myr.png'),
  sgd('SGD', 'Dolar Singapura', 'assets/icons/currency/round-country-flag-sgd.png'),
  ;

  const CurrencyCode(this.code, this.desc, this.image);
  final String code;
  final String desc;
  final String image;
}

final rateListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);
final currDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final exchangeRateProvider = StateProvider<double>((ref) => 0.0);
final exchangeCodeProvider = StateProvider<String>((ref) => 'SAR');
final baseCodeProvider = StateProvider<String>((ref) => 'IDR');
final baseRateProvider = StateProvider<double>((ref) => 0.0);

class ExchangeRateCtrl {
  final Ref ref;

  ExchangeRateCtrl(this.ref);

  void getRateByCurrency(String code) {
    final rate = ref.read(rateListProvider).firstWhere((element) => element.containsKey(code))[code];
    ref.read(exchangeCodeProvider.notifier).state = code;
    ref.read(exchangeRateProvider.notifier).state = rate;
    ref.read(baseCodeProvider.notifier).state = 'IDR';
    ref.read(baseRateProvider.notifier).state = rate;
  }
}

final exchangeRateCtrl = Provider(ExchangeRateCtrl.new);

final fetchKursProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  List<Map<String, dynamic>> result = [];
  List<String> currCode = CurrencyCode.values.map((e) => e.code).toList();

  final url = "https://datacenter.ortax.org/ortax/kursbi/list";

  await ref.read(dioProvider).get(url).then((res) {
    if (res.statusCode == 200) {
      final document = parse(res.data);
      final domDate = document.querySelector(
          "body > div.section-contents > div > div.row.mt-4 > div.col-12.col-lg-8 > div:nth-child(1) > div > div > div.content-footer.d-flex.flex-wrap > div:nth-child(1) > span");

      final dateStr = domDate?.innerHtml.trim().lastChars(11).trim();
      // log("dateStr : $dateStr", name: "EXCHANGE_RATE-CTRL");
      final date = (dateStr == null || dateStr.isEmpty) ? DateTime.now() : dateStr.toDateTime('dd MMM yyyy');
      log("date : $date", name: "EXCHANGE_RATE-CTRL");
      ref.read(currDateProvider.notifier).state = date;

      final domTable = document.querySelectorAll("#table-kursbi > tbody > tr");
      // log("domTable : ${domTable.length}", name: "EXCHANGE_RATE-CTRL");
      for (var element in domTable) {
        for (var el in element.children) {
          // log("element : $element", name: "EXCHANGE_RATE-CTRL");
          final confidence1 = el.attributes['data-header'];
          if (confidence1 == 'Grafik') {
            // log("confidence1 : $confidence1", name: "EXCHANGE_RATE-CTRL");
            final code = el.firstChild?.text;
            if (currCode.contains(code)) {
              final rateStr = el.nextElementSibling?.text;
              final rate = (rateStr == null) ? 0.0 : rateStr.toDouble();
              // log("code : $code | rate : $rate", name: "EXCHANGE_RATE-CTRL");
              result.add({"$code": rate});
              if (ref.read(exchangeCodeProvider) == code) {
                ref.read(exchangeRateProvider.notifier).state = rate;
              }
            }
          }
        }
        log("result $result", name: "EXCHANGE_RATE-CTRL");
      }
    }
  });
  ref.read(rateListProvider.notifier).state = result;
  return result;
});

// PROBLEM WITH SERVER CORS
final fetchRateByCurrency = FutureProvider.family<double, String>((ref, code) async {
  var rate = 0.0;
  for (var i = 0; i < 4; i++) {
    var date = DateTime.now().subtract(Duration(days: i));
    final uri = Uri(
      scheme: 'https',
      host: 'www.bi.go.id',
      path: '/biwebservice/wskursbi.asmx/getSubKursLokal3',
      queryParameters: {
        'mts': code,
        'startdate': date.dbDate(),
        'enddate': date.dbDate(),
      },
    ).toString();
    final dio = ref.read(dioProvider);
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] = 'GET,PUT,PATCH,POST,DELETE';
    dio.options.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept';
    await dio.get(uri).then((res) {
      log(res.data, name: "EXCHANGE_RATE-CTRL");
      if (res.statusCode == 200) {
        final document = parse(res.data);
        final dom = document.querySelector("#folder10 > div.opened > div:nth-child(10) > span:nth-child(2)");
        log("Rate : ${dom?.innerHtml}", name: "EXCHANGE_RATE-CTRL");
        rate = double.tryParse(dom!.innerHtml) ?? 0.0;
        // final document = XmlDocument.parse(res.data);
        // final kursBeli = document.findAllElements('beli_subkurslokal').first.innerText;
        // return kursBeli.toDouble();
      }
    });
  }
  return rate;
});
