import 'package:amoora/core/app_color.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class DetailBankAccount extends StatelessWidget {
  const DetailBankAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekening Transfer'.hardcoded,
            style: tsHeadlineS().bold(),
          ),
          SizedBox(
            width: context.screenWidth * .3,
            child: divider(
              padding: const EdgeInsets.symmetric(vertical: 5),
              thick: 3,
              color: oGold,
            ),
          ),
          10.height,
          const AccountNumber(
            bankName: 'BANK BSI (IDR)',
            accountName: 'PT Amoora',
            accountNumber: '1000123001',
          ),
          const AccountNumber(
            bankName: 'BANK BRI (IDR)',
            accountName: 'PT Amoora',
            accountNumber: '1000123001',
          ),
          const AccountNumber(
            bankName: 'BANK BCA SYARIAH (IDR)',
            accountName: 'PT Amoora',
            accountNumber: '1000123001',
          ),
        ],
      ),
    );
  }
}

class AccountNumber extends StatelessWidget {
  const AccountNumber({
    super.key,
    this.bankName,
    this.accountName,
    this.accountNumber,
  });

  final String? bankName;
  final String? accountName;
  final String? accountNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: Image.network('https://dummyimage.com/512x256'),
                  ),
                  Text(
                    bankName ?? '',
                    style: tsBodyM().bold(),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      accountName ?? '',
                      style: tsTitleM().bold(),
                    ),
                    Text(
                      accountNumber ?? '',
                      style: tsTitleM(),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.copy))
            ],
          ),
          divider(padding: const EdgeInsets.symmetric(vertical: 10)),
        ],
      ),
    );
  }
}
