import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/views/widgets/juz_card.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class JuzQuranView extends StatelessWidget {
  const JuzQuranView({super.key});

  static const routeName = '/juz_quran';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(QuranString.ajzaa),
      ),
      body: ListView.separated(
        itemCount: 30,
        separatorBuilder: (context, index) => divider(),
        itemBuilder: (context, index) => JuzCard(juz: index + 1),
      ),
    );
  }
}
