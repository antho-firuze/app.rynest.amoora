import 'dart:developer';

import 'package:amoora/features/product/model/product.dart';
import 'package:amoora/features/product/service/product_service.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final fetchProductsProvider =
    FutureProvider.autoDispose<List<int>>((ref) async => await ref.read(productCtrlProvider).list());
final fetchProductProvider =
    FutureProvider.autoDispose.family<Product?, int>((ref, id) async => await ref.read(productCtrlProvider).byId(id));

final viewGridProvider = StateProvider<bool>((ref) => false);

final selectedProductProvider = StateProvider<Product?>((ref) => null);
final roomDoubleQty = StateProvider<int>((ref) => 0);
final roomTripleQty = StateProvider<int>((ref) => 0);
final roomQuadQty = StateProvider<int>((ref) => 0);
final totalPriceUmroh = StateProvider<double>((ref) => 0);

class ProductController {
  Ref ref;
  ProductController(this.ref);

  Future<List<int>> list() async {
    final state = await AsyncValue.guard(() async => await ref.read(productServiceProvider).list());

    if (state.hasError) return [];

    List<dynamic> listProduct = state.value;
    log(':: state.value => ${state.value}');
    if (listProduct.isEmpty) {
      return [];
    }

    final result = listProduct.map((e) => e['id'] as int).toList();
    log(':: result => $result');

    return result;
  }

  Future<Product?> byId(int id) async {
    final data = {"id": id};
    final state = await AsyncValue.guard(() async => await ref.read(productServiceProvider).byId(data: data));

    if (state.hasError) return null;

    try {
      // log("${jsonDecode(state.value)}");
      Map<String, dynamic> dataJson = state.value;
      // log("$dataJson");

      final result = Product.fromJson(dataJson);
      // log(':: result => $result');

      return result;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future refreshDetail() async {
    final product = ref.read(selectedProductProvider);
    if (product?.id == null) return;
    ref.read(selectedProductProvider.notifier).state = await byId(product!.id!);
  }

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

final productCtrlProvider = Provider(ProductController.new);
