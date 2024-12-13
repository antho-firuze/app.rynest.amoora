import 'package:amoora/core/app_theme.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:flutter/material.dart';

class DuaKhatamView extends StatelessWidget {
  const DuaKhatamView({super.key});

  static const routeName = '/dua_khatam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doa Khatam Al-Qur'an"),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset(
        //       QuranAsset.icFontDecrease,
        //       theme: const SvgTheme(currentColor: Colors.white),
        //     ),
        //   )
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              children: [
                TextSpan(
                  text: QuranString.douaaKhatmQuran,
                  style: TextStyle(
                    fontFamily: AppTheme.secondaryFont,
                    fontSize: context.isLandscape() ? 27 : 25,
                    color: Colors.black.whenDark(Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
