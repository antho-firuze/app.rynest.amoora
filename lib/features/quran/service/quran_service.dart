import 'dart:io';

import 'package:amoora/env/env.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranService {
  final Ref ref;
  QuranService(this.ref);

  static String baseUrl = Env.quranRepoUrl;
  static const zipFileName = 'quran-images.zip';
  static String quranRepoUrl = '$baseUrl/assets/amoora/$zipFileName';

  Future<bool> downloadFile({required File file, Function(int, int)? onReceiveProgress}) async {
    try {
      final url = Uri.parse(quranRepoUrl);

      final response = await ref.read(dioFileDownloadProvider).getUri(url, onReceiveProgress: onReceiveProgress);

      if (response.statusCode == 200) {
        var fo = file.openSync(mode: FileMode.write);
        fo.writeFromSync(response.data);
        await fo.close();
        return true;
      } else {
        var errString = ':: downloadFile (Error) => $zipFileName not available on Repositori Site !';
        return Future.error(errString);
      }
    } catch (e) {
      throw Exception(':: downloadFile (Error) => $e');
    }
  }

  // Future<bool> checkRepoSiteAvailable() async => await InternetAddress.lookup(baseUrl)
  //     .then((value) => (value.isNotEmpty && value[0].rawAddress.isNotEmpty))
  //     .onError(Future.error);

  // Future<bool> checkRepoFileAvailable() async =>
  //     await ref.read(dioProvider).get(quranRepoUrl).then((res) => res.statusCode == 200).onError(Future.error);

  // String getPageDir(int number) {
  //   return '$_pageDir/page${formattedPageNumber(number)}.png';
  // }

  // Future<bool> checkQuranFileExists() async {
  //   var filePath = '$_appDirPath/quran-images/page001.png';
  //   var file = File(filePath);

  //   if (await file.exists()) {
  //     log('$filePath => File Quran is Exists !');
  //     return true;
  //   }

  //   return await _downloadAndExtract();
  // }

  // Future<bool> _downloadAndExtract() async {
  //   var filePath = '$_appDirPath/quran-images.zip';
  //   var file = File(filePath);

  //   var destinationDir = await Directory(_appDirPath).create(recursive: true);

  //   if (await file.exists()) {
  //     // Extract
  //     log('Only Extract File Quran !');
  //     return await _extractZip(file, destinationDir);
  //   }

  //   // Download
  //   log('Download and Extract File Quran !');
  //   return await _downloadFile(quranRepoUrl, file).then((value) async {
  //     // Extract
  //     return await _extractZip(file, destinationDir);
  //   }).onError(Future.error);
  // }

  // void _showDownloadProgress(received, total) {
  //   if (total != -1) {
  //     _progressType = 'downloading';
  //     _progress = (received / total * 100);
  //     ref.read(progressNameProvider.notifier).state = _progressType;
  //     ref.read(progressProvider.notifier).state = _progress;
  //     log("Download progress: ${(received / total * 100).toStringAsFixed(0)} %");
  //   }
  // }

  // Future<bool> extractZipFile(File zipFile, Directory destinationDir) async {
  //   return await ZipFile.extractToDirectory(
  //     zipFile: zipFile,
  //     destinationDir: destinationDir,
  //     onExtracting: (zipEntry, progress) {
  //       _showExtractProgress(progress);
  //       return ZipFileOperation.includeItem;
  //     },
  //   ).then((value) async {
  //     await zipFile.delete();
  //     log('${zipFile.path} <======== deleted !');
  //     return true;
  //   }).onError((error, stackTrace) async {
  //     await _deleteZipQuran();
  //     return Future.error(error.toString());
  //   });
  // }

  // void _showExtractProgress(progress) {
  //   _progressType = 'extracting';
  //   _progress = progress;
  //   ref.read(progressNameProvider.notifier).state = _progressType;
  //   ref.read(progressProvider.notifier).state = _progress;
  //   log('Extract progress: ${progress.toStringAsFixed(1)} %');
  // }

  // Future<void> clearQuranData() async => await _deleteDirQuran();

  // Future<void> _deleteDirQuran() async {
  //   var dirPath = '$_appDirPath/quran-images';
  //   await Directory(dirPath)
  //       .delete(recursive: true)
  //       .then((value) => log('$dirPath <======== deleted !'))
  //       .onError((error, stackTrace) => log(error.toString()));
  // }

  // Future<void> _deleteZipQuran() async {
  //   var filePath = '$_appDirPath/quran-images.zip';
  //   await File(filePath)
  //       .delete(recursive: true)
  //       .then((value) => log('$filePath <======== deleted !'))
  //       .onError((error, stackTrace) => log(error.toString()));
  // }
}

final quranServiceProvider = Provider(QuranService.new);
