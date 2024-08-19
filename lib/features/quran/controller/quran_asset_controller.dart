import 'dart:developer';
import 'dart:io';

import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/service/quran_service.dart';
import 'package:amoora/utils/path_service.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quranAssetStateProvider = StateProvider<String>((ref) => '');
final progressProvider = StateProvider<double>((ref) => 0);
final quranAssetErrorProvider = StateProvider<String>((ref) => '');

class QuranAssetCtrl {
  Ref ref;
  QuranAssetCtrl(this.ref);

  String _appDirPath = '', _pageDir = '';

  void checkFileExists() async {
    _appDirPath = await ref.read(pathServiceProvider).getAppFileDirectory();
    _pageDir = '$_appDirPath/quran-images';

    var filePath = '$_appDirPath/quran-images/page001.png';
    var file = File(filePath);

    if (await file.exists()) {
      log('$filePath => File Quran is Exists !');
      ref.read(quranAssetStateProvider.notifier).state = 'file_exists';
    } else {
      ref.read(quranAssetStateProvider.notifier).state = 'file_not_exists';
    }
  }

  String getPageDir(int number) => '$_pageDir/page${formattedPageNumber(number)}.png';

  Future<void> getFile() async {
    var filePath = '$_appDirPath/quran-images.zip';
    var file = File(filePath);

    var destinationDir = await Directory(_appDirPath).create(recursive: true);

    try {
      if (await file.exists()) {
        // Extract
        log(':: Only Extract the File Quran !');
        await _extractZipFile(file, destinationDir);
        return;
      }

      // Download
      await ref.read(quranServiceProvider).downloadFile(file: file, onReceiveProgress: _showDownloadProgress);

      // Extract
      await _extractZipFile(file, destinationDir);

      ref.read(quranAssetStateProvider.notifier).state = 'file_exists';
      checkFileExists();
    } catch (e) {
      ref.read(quranAssetStateProvider.notifier).state = 'error';
      log(':: getFile (Error) => $e');
      throw Exception('$e');
    }
  }

  void _showDownloadProgress(received, total) {
    if (total != -1) {
      ref.read(quranAssetStateProvider.notifier).state = 'downloading';
      ref.read(progressProvider.notifier).state = (received / total * 100);
      log("Download progress: ${(received / total * 100).toStringAsFixed(0)} %");
    } else {
      log("Download Done => ${(received / total * 100).toStringAsFixed(0)} %");
    }
  }

  Future<void> _extractZipFile(File zipFile, Directory destinationDir) async {
    try {
      // Extract the file
      await ZipFile.extractToDirectory(
          zipFile: zipFile,
          destinationDir: destinationDir,
          onExtracting: (zipEntry, progress) {
            log('Extract progress: ${progress.toStringAsFixed(1)} %');
            ref.read(quranAssetStateProvider.notifier).state = 'extracting';
            ref.read(progressProvider.notifier).state = progress;
            return ZipFileOperation.includeItem;
          });

      // Clean the garbage
      await zipFile.delete();
    } catch (e) {
      throw Exception(':: extractZipFile (Error) => $e');
    }
  }

  Future<void> clearQuranData() async => await _deleteDirQuran();

  Future<void> _deleteDirQuran() async {
    var dirPath = '$_appDirPath/quran-images';
    await Directory(dirPath)
        .delete(recursive: true)
        .then((value) => log(':: Delete directory => $dirPath'))
        .onError((error, stackTrace) => log(error.toString()));
  }

  // Future<void> _deleteZipQuran() async {
  //   var filePath = '$_appDirPath/quran-images.zip';
  //   await File(filePath)
  //       .delete(recursive: true)
  //       .then((value) => log(':: Delete file => $filePath'))
  //       .onError((error, stackTrace) => log(error.toString()));
  // }
}

final quranAssetCtrlProvider = Provider(QuranAssetCtrl.new);
