import 'dart:developer';
import 'dart:io';

import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final albumListProvider = StateProvider<List<AssetPathEntity>>((ref) => []);
final selectedAlbumProvider = StateProvider<AssetPathEntity?>((ref) => null);
final assetListProvider = StateProvider<List<AssetEntity>>((ref) => []);

class MediaPickerCtrl {
  Ref ref;
  MediaPickerCtrl(this.ref);

  Future<void> initialized() async {
    await loadAlbum(RequestType.image);
  }

  Future getPermission() async {
    ref.read(allowCameraAndStorageProvider.notifier).state =
        await ref.read(permissionServiceProvider).requestCameraAndMediaPermission();

    if (ref.read(allowCameraAndStorageProvider)) {
      await initialized();
    }
  }

  Future refresh() async {
    await loadAlbum(RequestType.image);
  }

  Future<void> loadAlbum(RequestType requestType) async {
    var albumList = await PhotoManager.getAssetPathList(type: requestType);

    if (albumList.isNotEmpty) {
      ref.read(albumListProvider.notifier).state = albumList;
      await loadAssets(albumList[0]);
    }
  }

  Future<void> loadAssets(AssetPathEntity selectedAlbum) async {
    ref.read(selectedAlbumProvider.notifier).state = selectedAlbum;
    ref.read(assetListProvider.notifier).state =
        await selectedAlbum.getAssetListRange(start: 0, end: await selectedAlbum.assetCountAsync);
  }

  Future<File?> selectedAsset(AssetEntity selectedAsset) async {
    File? file = await selectedAsset.originFile;
    file = await compressImage(file!);
    return file;
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

    log('original size => ${file.lengthSync()}');
    log('compressed size => ${fille.lengthSync()}');

    return fille;
  }
}

final mediaPickerCtrlProvider = Provider(MediaPickerCtrl.new);
