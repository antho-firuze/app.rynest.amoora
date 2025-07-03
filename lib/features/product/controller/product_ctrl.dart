
import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/features/product/model/product.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final fetchProductsProvider = FutureProvider<List<int>>((ref) async {
  final reqs = Reqs(path: '/api/v1/product/list');
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  // log('fetchProductsProvider => ${state.value}', name: 'PRODUCT-CTRL');
  List<dynamic> jsonList = state.value;
  final result = jsonList.map((e) => e['id'] as int).toList();

  return result;
});

final fetchProductByIdProvider = FutureProvider.family<Product?, int>((ref, id) async {
  final reqs = Reqs(path: '/api/v1/product/byId', data: {"id": id});
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  // log('fetchProductProvider => ${state.value}', name: 'PRODUCT-CTRL');
  Map<String, dynamic> json = state.value;
  final result = Product.fromJson(json);

  return result;
});

final viewGridProvider = StateProvider<bool>((ref) => false);
final selectedProductProvider = StateProvider<Product?>((ref) => null);
final roomDoubleQty = StateProvider<int>((ref) => 0);
final roomTripleQty = StateProvider<int>((ref) => 0);
final roomQuadQty = StateProvider<int>((ref) => 0);
final totalPriceUmroh = StateProvider<double>((ref) => 0);

class ProductCtrl {
  Ref ref;
  ProductCtrl(this.ref);

  void calculate(String roomType, String calcType) {
    var item = ref.read(selectedProductProvider);

    var doubleQty = ref.read(roomDoubleQty);
    var tripleQty = ref.read(roomTripleQty);
    var quadQty = ref.read(roomQuadQty);

    switch (roomType) {
      case 'double':
        if (calcType == 'add') {
          ref.read(roomDoubleQty.notifier).state = doubleQty + 1;
        } else {
          if (doubleQty < 1) return;
          ref.read(roomDoubleQty.notifier).state = doubleQty - 1;
        }
        break;
      case 'triple':
        if (calcType == 'add') {
          ref.read(roomTripleQty.notifier).state = tripleQty + 1;
        } else {
          if (tripleQty < 1) return;
          ref.read(roomTripleQty.notifier).state = tripleQty - 1;
        }
        break;
      case 'quad':
        if (calcType == 'add') {
          ref.read(roomQuadQty.notifier).state = quadQty + 1;
        } else {
          if (quadQty < 1) return;
          ref.read(roomQuadQty.notifier).state = quadQty - 1;
        }
        break;
    }

    double doublePrice = item?.doublePrice ?? 0;
    double triplePrice = item?.triplePrice ?? 0;
    double quadPrice = item?.quadPrice ?? 0;

    ref.read(totalPriceUmroh.notifier).state = (doublePrice * ref.read(roomDoubleQty)) +
        (triplePrice * ref.read(roomTripleQty)) +
        (quadPrice * ref.read(roomQuadQty));
  }

  void bookingNow() {
    var item = ref.read(selectedProductProvider);

    var doubleQty = ref.read(roomDoubleQty);
    var tripleQty = ref.read(roomTripleQty);
    var quadQty = ref.read(roomQuadQty);

    var paket = item?.name;
    var hari = '${item?.duration} hari';
    var tanggal = item?.departureDate!.yMMMMd();
    var text = "Assalamu'alaikum *Amoora Travel*\n\n"
        "Saya ingin mendaftar paket umrah *$paket* program *$hari* untuk "
        "keberangkatan tanggal *$tanggal*";
    text += doubleQty > 0 || tripleQty > 0 || quadQty > 0 ? "\n\nDengan kamar :" : "";
    text += doubleQty > 0 ? "\n- *Double* : $doubleQty pax" : "";
    text += tripleQty > 0 ? "\n- *Triple* : $tripleQty pax" : "";
    text += quadQty > 0 ? "\n- *Quad* : $quadQty pax" : "";
    text += "\n\nMohon informasi lebih lanjut terkait paket tersebut";

    var number = '+6282311340011';
    launchUrl(Uri.parse('https://wa.me/$number/?text=${Uri.encodeComponent(text)}'));
  }
}

final productCtrlProvider = Provider(ProductCtrl.new);
