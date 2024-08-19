import 'dart:io';

import 'package:amoora/common/exceptions/image_failed.dart';
import 'package:amoora/common/exceptions/loading_failed.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_controller.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailAirlines extends ConsumerWidget {
  const DetailAirlines({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Penerbangan'.hardcoded).tsHeadlineS().bold(),
          divider(padding: const EdgeInsets.symmetric(vertical: 5)),
          10.height,
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => 10.height,
            itemCount: item.airlines?.length ?? 0,
            itemBuilder: (context, index) {
              var airline = item.airlines?[index];
              if (airline == null) return null;
              return Card(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                          child: Row(
                            children: [
                              ref.watch(getImageProvider("${airline.image}|${airline.code}")).when(
                                    data: (data) => Image.file(
                                      File(data),
                                      height: 40,
                                      errorBuilder: (context, error, stackTrace) => const ImageFailed(),
                                    ),
                                    error: (error, stackTrace) => LoadingFailed(
                                      onTap: () => ref.refresh(getImageProvider("${airline.image}|${airline.code}")),
                                    ),
                                    loading: () => const CircularProgressIndicator(),
                                  ),
                              5.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(airline.name).tsTitleM().bold(),
                                    Text(airline.code).tsTitleS(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        15.height,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Keberangkatan').tsTitleM(),
                                  5.height,
                                  Text(airline.checkIn!.yMMMd()).tsTitleL().bold(),
                                  3.height,
                                ],
                              ),
                              const Column(
                                children: [
                                  Icon(Icons.local_airport, color: oRed50),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kedatangan',
                                    style: tsTitleM(),
                                  ),
                                  5.height,
                                  Text(airline.checkOut!.yMMMd()).tsTitleL().bold(),
                                  3.height,
                                ],
                              ),
                            ],
                          ),
                        ),
                        5.height,
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
