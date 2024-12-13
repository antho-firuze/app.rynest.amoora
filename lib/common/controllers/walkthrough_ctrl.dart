import 'package:amoora/core/app_string.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Map<String, dynamic>> walks = [
  {
    'image': 'landing_1.png',
    'color': getRandomColor(),
    'title': 'Selamat Datang di ${AppString.appName}',
    'subTitle':
        'Aplikasi Haji & Umroh Terdepan, Panduan pintar untuk perjalanan ibadah Anda.',
  },
  {
    'image': 'landing_2.png',
    'color': getRandomColor(),
    'title': 'Mudah dan Lengkap',
    'subTitle':
        'Petunjuk rinci untuk Persiapan dan Perencanaan Ibadah Haji & Umroh.',
  },
  {
    'image': 'landing_3.png',
    'color': getRandomColor(),
    'title': 'Teknologi Modern untuk Perjalanan Ibadah Anda',
    'subTitle': 'Aplikasi canggih yang membantu anda setiap langkah.',
  },
  {
    'image': 'landing_4.png',
    'color': getRandomColor(),
    'title': 'Paket Personalisasi',
    'subTitle':
        'Sesuaikan rencana perjalanan Anda sesuai kebutuhan dan preferensi.',
  },
  {
    'image': 'landing_5.png',
    'color': getRandomColor(),
    'title': 'Informasi Real-Time',
    'subTitle':
        'Update Langsung dari Tanah Suci untuk Memastikan Keamanan dan Kenyamanan.',
  },
  {
    'image': 'landing_6.png',
    'color': getRandomColor(),
    'title': 'Komunitas Ibadah Global',
    'subTitle':
        'Terhubung dengan Sesama Jamaah untuk Berbagi Pengalaman dan Tips.',
  },
];

final walkthroughCtrlProvider = NotifierProvider(WalkthroughCtrl.new);

class WalkthroughCtrl extends Notifier<void> {
  @override
  void build() {}

  void getStarted() {
    ref.read(sharedPrefProvider).setBool('SHOW_WALKTHROUGH', false);
    ref.read(goRouterProvider).go('/home');
  }
}
