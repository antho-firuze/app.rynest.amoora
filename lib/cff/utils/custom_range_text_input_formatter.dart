import 'package:flutter/services.dart';

class CustomRangeTextInputFormatter extends TextInputFormatter {
  final int minVal;
  final int maxVal;

  CustomRangeTextInputFormatter({this.minVal = 1, required this.maxVal});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return const TextEditingValue();
    } else if (int.parse(newValue.text) < minVal) {
      return const TextEditingValue();
    }

    return int.parse(newValue.text) > maxVal ? const TextEditingValue().copyWith(text: oldValue.text) : newValue;
  }
}
