import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xml/xml.dart';

final currExchangeDate = StateProvider<DateTime>((ref) => DateTime.now());
final currExchangeRate = StateProvider<double>((ref) => 0.0);
final currExchangeCode = StateProvider<String>((ref) => 'SAR');
final currExchangeBaseCode = StateProvider<String>((ref) => 'IDR');
final currExchangeBaseRate = StateProvider<double>((ref) => 0.0);

final exchangeRateSvc = Provider(ExchangeRateService.new);

class ExchangeRateService {
  final Ref ref;

  ExchangeRateService(this.ref);

  static const exchangeRateKey = 'EXCHANGE_RATE_KEY';
  static List<String> currCode = ['SAR', 'USD', 'EUR', 'MYR', 'SGD'];

  // Future getFetchRate({DateTime? date}) async {
  //   date ??= DateTime.now();

  //   Map<String, dynamic> result = {};
  //   for (final curr in currCode) {
  //     final uri = Uri(
  //       scheme: 'https',
  //       host: 'www.bi.go.id',
  //       path: '/biwebservice/wskursbi.asmx/getSubKursLokal3',
  //       queryParameters: {
  //         'mts': curr,
  //         'startdate': date.dbDate(),
  //         'enddate': date.dbDate(),
  //       },
  //     ).toString();
  //     result[curr] = await _fetchRate(uri);
  //   }
  //   log(result.toString());
  // }

  // Future<double> _fetchRate(String uri) async =>
  //     await ref.read(dioProvider).get(uri).then(
  //       (res) {
  //         if (res.statusCode == 200) {
  //           final document = XmlDocument.parse(res.data);
  //           final kursBeli =
  //               document.findAllElements('beli_subkurslokal').first.innerText;
  //           return kursBeli.toDouble();
  //         }
  //         return 0.0;
  //       },
  //     ).onError((error, stackTrace) => 0.0);

  Future initialize() async {
    if (ref.read(currExchangeRate) == 0.0) {
      await fetchRateByCurrency('SAR');
    }
  }

  Future<double> fetchRateByCurrency([String? code]) async {
    code ??= ref.read(currExchangeCode);

    // looping for 4 days back
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
      var rate = await ref.read(dioProvider).get(uri).then(
        (res) {
          // log(res.data);
          if (res.statusCode == 200) {
            final document = XmlDocument.parse(res.data);
            final kursBeli = document.findAllElements('beli_subkurslokal').first.innerText;
            return kursBeli.toDouble();
          }
          return 0.0;
        },
      ).onError((error, stackTrace) => 0.0);

      if (rate > 0) {
        ref.read(currExchangeDate.notifier).state = date;
        ref.read(currExchangeCode.notifier).state = code!;
        ref.read(currExchangeRate.notifier).state = rate;
        ref.read(currExchangeBaseCode.notifier).state = 'IDR';
        ref.read(currExchangeBaseRate.notifier).state = rate;
        return rate;
      }
    }

    return 0.0;
  }
}
