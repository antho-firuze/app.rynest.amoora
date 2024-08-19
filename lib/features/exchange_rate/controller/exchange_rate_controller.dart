import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final exchangeRateCtrl = Provider(ExchangeRateCtrl.new);

class ExchangeRateCtrl {
  final Ref ref;

  ExchangeRateCtrl(this.ref);

  void openMaps() {
    launchUrl(
      mode: LaunchMode.externalApplication,
      Uri.parse('https://www.google.com/maps/search/money+changer'),
    );
  }

}
