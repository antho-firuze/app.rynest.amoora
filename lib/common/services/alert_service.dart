import 'package:amoora/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:amoora/localization/string_hardcoded.dart';

class AlertService {
  static Future show({
    required String body,
    String title = 'Informasi',
    String? noCaption,
    String? okCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onOk,
    VoidCallback? onYes,
    bool showNo = false,
    bool showOk = false,
    bool showYes = false,
  }) async {
    return await showCupertinoModalPopup(
      context: rootNavigatorKey.currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          if (showOk)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop(true);
                if (onOk != null) onOk();
              },
              child: Text(okCaption ?? "Ok".hardcoded),
            ),
          if (showYes)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop(true);
                if (onYes != null) onYes();
              },
              child: Text(yesCaption ?? "Ya".hardcoded),
            ),
          if (showNo)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(false);
                if (onNo != null) onNo();
              },
              child: Text(noCaption ?? "Tidak".hardcoded),
            ),
        ],
      ),
    );
  }

  static Future<void> confirm({
    required String body,
    String title = 'Konfirmasi',
    String? noCaption,
    String? okCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onOk,
    VoidCallback? onYes,
    bool showNo = true,
    bool showYes = true,
    bool showOk = false,
  }) async {
    await AlertService.show(
      title: title,
      body: body,
      yesCaption: yesCaption,
      noCaption: noCaption,
      okCaption: okCaption,
      onYes: onYes,
      onNo: onNo,
      onOk: onOk,
      showYes: showYes,
      showNo: showNo,
      showOk: showOk,
    );
  }

  static Future<void> showOk({
    required String body,
    String title = 'Informasi',
    String? okCaption,
    VoidCallback? onOk,
  }) async {
    await AlertService.show(
      title: title,
      body: body,
      okCaption: okCaption,
      onOk: onOk,
      showOk: true,
    );
  }
}
