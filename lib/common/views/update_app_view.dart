import 'package:amoora/common/widgets/app_logo.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class UpdateAppView extends StatelessWidget {
  const UpdateAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              // Logo
              const AppLogo(),
              30.height,
              Text(
                'Perbarui ke Versi Terbaru'.hardcoded,
                style: tsTitleL().bold(),
              ),
              10.height,
              Text(
                  'Agar aktivitas Anda di Amoora tetap lancar, yuk update ke versi terbaru !'
                      .hardcoded),
              40.height,
              ElevatedButton(
                onPressed: () {},
                child: const Text('Perbarui Sekarang'),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
