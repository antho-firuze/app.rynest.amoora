import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/exchange_rate/service/calculator_service.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Numpad extends ConsumerWidget {
  const Numpad({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var buttons = ref.read(calcSvc).buttons;
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          childAspectRatio: 1.3.whenLandscape(1.17)!,
        ),
        itemBuilder: (context, index) {
          switch (buttons[index]) {
            /// CLEAR BTN
            case 'C':
              return CustomAppButton(
                buttonTapped: ref.read(calcSvc).clear,
                text: buttons[index],
              );

            /// DELETE BTN
            case 'DEL':
              return CustomAppButton(buttonTapped: ref.read(calcSvc).delete, text: buttons[index]);

            /// SWITCH CURRENCY BTN
            case '⇅':
              return CustomAppButton(buttonTapped: ref.read(calcSvc).switchCurrency, text: buttons[index]);

            /// EQUAL BTN
            case '=':
              return CustomAppButton(
                  buttonTapped: ref.read(calcSvc).equal,
                  color: Colors.orange[400],
                  textColor: oBlack30,
                  text: buttons[index]);

            default:
              return CustomAppButton(
                buttonTapped: () => ref.read(calcSvc).onBtnTapped(buttons[index]),
                color: ref.read(calcSvc).isOperator(buttons[index]) ? Colors.orange[400] : null,
                textColor: oBlack30,
                text: buttons[index],
              );
          }
        });
  }
}

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    this.color,
    this.textColor,
    required this.text,
    required this.buttonTapped,
  });

  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback buttonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
