import 'dart:developer';
import 'dart:io';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/utils/uuid_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;

final camerasProvider = StateProvider<List<CameraDescription>>((ref) => []);
final cameraLensProvider = StateProvider<CameraLensDirection?>((ref) => null);
final flashIconProvider = StateProvider<IconData>((ref) => Icons.flash_auto);
final cameraFileProvider = StateProvider<File?>((ref) => null);

final refreshCameraProvider = StateProvider<String?>((ref) => null);

class CameraCtrl {
  Ref ref;
  CameraCtrl(this.ref);

  late List<CameraDescription> cameras;
  late CameraDescription frontCamera, backCamera;
  CameraController? controller;

  CameraLensDirection lens = CameraLensDirection.front;
  FlashMode flash = FlashMode.auto;
  IconData flashIcon = Icons.flash_auto;

  Future<void> initialized() async {
    cameras = await availableCameras();
    // cameras = ref.read(camerasProvider.notifier).state;

    ref.read(cameraFileProvider.notifier).state = null;

    await getAvailableCamera();
  }

  Future<void> getPermission() async {
    ref.read(allowCameraAndStorageProvider.notifier).state = await ref.read(permissionServiceProvider).requestCameraAndMediaPermission();

    if (ref.read(allowCameraAndStorageProvider)) {
      await initialized();
    }
  }

  Future<void> getAvailableCamera() async {
    if (ref.read(allowCameraAndStorageProvider) != true) {
      return await getPermission();
    }

    if (cameras.isNotEmpty) {
      frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
      backCamera = cameras.lastWhere((camera) => camera.lensDirection == CameraLensDirection.back);
      await updateLensDirection();
    }
  }

  Future<void> updateLensDirection() async {
    if (lens == CameraLensDirection.front) {
      controller = CameraController(frontCamera, ResolutionPreset.medium, enableAudio: false);
    } else {
      controller = CameraController(backCamera, ResolutionPreset.medium, enableAudio: false);
      controller?.setFlashMode(flash);
    }
    await controller?.initialize().then((_) {
      ref.read(refreshCameraProvider.notifier).state = uuid.v4();
      ref.read(cameraLensProvider.notifier).state = lens;
    });
  }

  void flashMode() async {
    switch (flash) {
      case FlashMode.auto:
        flash = FlashMode.always;
        flashIcon = Icons.flash_on;
        break;
      case FlashMode.always:
        flash = FlashMode.torch;
        flashIcon = Icons.flashlight_on;
        break;
      case FlashMode.torch:
        flash = FlashMode.off;
        flashIcon = Icons.flash_off;
        break;
      case FlashMode.off:
        flash = FlashMode.auto;
        flashIcon = Icons.flash_auto;
        break;
    }
    controller?.setFlashMode(flash);
    ref.read(flashIconProvider.notifier).state = flashIcon;
  }

  void switchCamera() {
    if (lens == CameraLensDirection.front) {
      lens = CameraLensDirection.back;
    } else {
      lens = CameraLensDirection.front;
    }
    updateLensDirection();
  }

  Future<void> capture() async {
    XFile xfile = await controller!.takePicture();

    File file = File(xfile.path);
    log('original size => ${file.lengthSync()}', name: 'CAMERA-CTRL');

    file = await flipImage(file);
    file = await compressImage(file);

    log('final size => ${file.lengthSync()}', name: 'CAMERA-CTRL');

    ref.read(cameraFileProvider.notifier).state = file;
  }

  Future<File> compressImage(File file) async {
    final lastIndex = file.absolute.path.lastIndexOf(RegExp(r'.jp'));
    final splitted = file.absolute.path.substring(0, (lastIndex));
    final outPath = "${splitted}_out${file.absolute.path.substring(lastIndex)}";

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 100,
    );
    File fille = File(compressedFile!.path);

    log('compressed size => ${fille.lengthSync()}', name: 'CAMERA-CTRL');

    return fille;
  }

  Future<File> flipImage(File file) async {
    if (lens == CameraLensDirection.front) {
      // FLIP IMAGE TO HORIZONTAL
      Uint8List imageBytes = await file.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageBytes);
      img.Image fixedImage = img.flipHorizontal(originalImage!);
      log('fliped size => ${fixedImage.lengthInBytes}', name: 'CAMERA-CTRL');

      return await file.writeAsBytes(img.encodeJpg(fixedImage), flush: true);
    }

    return file;
  }

  Future save() async {
    var file = ref.read(cameraFileProvider);
    return ref.read(goRouterProvider).pop(file);
  }

  void onCameraTap(double x, double y) async {
    if (controller?.value.isInitialized != true) return;
    if (lens == CameraLensDirection.front) return;

    //   x = details.localPosition.dx;
    //   y = details.localPosition.dy;
    //   double sWidth = screenWidth!;
    //   double sHeight = screenHeight!;

    //   setState(() {
    //     controller.setFocusPoint(Offset(x / sWidth, y / sHeight));
    //     controller.setExposurePoint(Offset(x / sWidth, y / sHeight));
    //     showFocusCircle = true;

    //     Future.delayed(const Duration(seconds: 2)).whenComplete(() {
    //       setState(() {
    //         showFocusCircle = false;
    //       });
    //     });
    //   });
  }
}

final cameraCtrlProvider = Provider(CameraCtrl.new);
