import 'package:amoora/common/controllers/camera_ctrl.dart';
import 'package:amoora/common/controllers/media_picker_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/common/views/media_picker/widget/camera_picker.dart';
import 'package:amoora/common/views/media_picker/widget/gallery_picker.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaPickerView extends ConsumerStatefulWidget {
  const MediaPickerView({super.key});

  @override
  ConsumerState<MediaPickerView> createState() => _PickImageViewState();
}

class _PickImageViewState extends ConsumerState<MediaPickerView> with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    tabController = TabController(length: 2, vsync: this);

    ref.read(cameraCtrlProvider).initialized();
    ref.read(mediaPickerCtrlProvider).initialized();

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(allowCameraAndStorageProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pilih Gambar'.hardcoded)),
          body: ListView(
            children: [
              WarningException(
                title: 'Izinkan akses Galery & Camera !',
                child: ElevatedButton(
                  onPressed: () async => await ref.read(cameraCtrlProvider).getPermission(),
                  child: Text('Izinkan Akses'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pilih Gambar'),
        ),
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                tabController.animateTo(value);
              },
              children: const [
                GalleryPicker(),
                CameraPicker(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: TabBar(
            controller: tabController,
            onTap: (value) => pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            indicatorWeight: 3.0,
            indicatorColor: primaryLight.whenDark(secondaryLight),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                child: Text(
                  'Gallery',
                  textScaler: TextScaler.linear(.9),
                ),
              ),
              Tab(
                child: Text(
                  'Camera',
                  textScaler: TextScaler.linear(.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
