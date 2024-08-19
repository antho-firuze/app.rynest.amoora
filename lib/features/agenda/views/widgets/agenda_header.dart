import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class AgendaHeader extends StatelessWidget {
  const AgendaHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'JADWAL KEGIATAN PERJALANAN IBADAH UMROH\n'
          'JEDAH - MEKKAH - MADINAH \n'
          'PROGRAM 09 HARI 12 DESEMBER 2023',
          style: tsTitleM().bold(),
          textAlign: TextAlign.center,
        ),
        10.height,
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              children: [
                FieldList(
                  caption: const Text('Nama Maskapai'),
                  value: const Text('Garuda Indonesia').right().bold(),
                ),
                divider(padding: const EdgeInsets.symmetric(vertical: 6)),
                FieldList(
                  caption: const Text('Nomor Penerbangan'),
                  value: const Text('GA-007').right().bold(),
                ),
                divider(padding: const EdgeInsets.symmetric(vertical: 6)),
                FieldList(
                  caption: const Text('Hotel Mekkah'),
                  value: const Text('Emaar Grand Hotel').right().bold(),
                ),
                divider(padding: const EdgeInsets.symmetric(vertical: 6)),
                FieldList(
                  caption: const Text('Hotel Madinah'),
                  value: const Text('Elaf Taiba Hotel').right().bold(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
