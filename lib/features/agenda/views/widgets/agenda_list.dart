import 'package:amoora/common/widgets/forms/field_list.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class AgendaList extends StatelessWidget {
  const AgendaList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 9,
      separatorBuilder: (context, index) => 5.height,
      itemBuilder: (context, index) {
        var isDone = false;
        var desc = '';
        switch (index) {
          case 0:
            isDone = true;
            desc = "Jama'ah berkumpul di Bandara Soekarno Hatta International. "
                "Airport Cengkareng, terminal 3 pintu 1.";
            break;
          case 1:
            isDone = true;
            desc = "Umroh Akhir Tahun Hari ke-3";
            break;
          case 2:
            desc = "MADINAH Ibadah Mandiri, kajian, dan ziarah kota Madinah "
                "mengunjungi Masjid Quba, kebun kurma, Jabal Uhud, "
                "Masjid Qiblatain, dan tempat – tempat lainnya yang "
                "masih terjangkau (disarankan untuk berwudhu di hotel sebelum perjalanan).";
            break;
          case 3:
            desc = "MADINAH - MAKKAH Berangkat menuju Bir Ali untuk mengambil "
                "Miqat dan Niat Umrah, Shalat Sunah dan melanjutkan perjalanan "
                "menuju Makkah (sepanjang perjalanan jama’ah dianjurkan bertalbiah dan bershalawat). "
                "Persiapan menuju Masjidil Haram dilanjut pelaksanaan Umroh pertama";
            break;
          default:
        }

        return Card(
          color: isDone ? Colors.green.withValues(alpha: .1) : null,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: isDone
                    ? Icon(
                        Icons.done,
                        color: oDarkGreen.withValues(alpha: .5),
                        size: 70,
                      )
                    : Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldList(
                      caption: const Text('Jakarta - Jeddah - Mekkah').bold(),
                      value: Text('Hari ke-${index + 1}').right().bold(),
                    ),
                    FieldList(
                      caption:
                          Text(DateTime.now().subtract(Duration(days: index + 1)).custom('EEEE, d MMM yyyy')).bold(),
                      value: const Text('Jam: 13:00 - 16:30').right().bold(),
                    ),
                    divider(padding: const EdgeInsets.symmetric(vertical: 8)),
                    Text(desc),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
