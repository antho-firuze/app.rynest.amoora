import 'package:amoora/features/exchange_rate/controller/exchange_rate_ctrl.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final inputValue = StateProvider<String>((ref) => '');
final outputValue = StateProvider<String>((ref) => '');
final exchangeValue = StateProvider<String>((ref) => '');

final calcCtrl = Provider(CalcCtrl.new);

class CalcCtrl {
  final Ref ref;

  CalcCtrl(this.ref);

  final List<String> buttons = [
    "C",
    "DEL",
    "⇅",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];
  var userInput = '';
  var userOutput = '';
  var exchangeOutput = '';
  bool needCalc = false;

  void clear() {
    needCalc = false;
    userInput = '';
    userOutput = '';
    exchangeOutput = '';
    ref.read(inputValue.notifier).state = userInput;
    ref.read(outputValue.notifier).state = userOutput;
    ref.read(exchangeValue.notifier).state = exchangeOutput;
  }

  void delete() {
    needCalc = false;
    userInput = userInput.substring(0, userInput.length - 1);
    ref.read(inputValue.notifier).state = userInput;
    convert(userInput);
  }

  void equal() {
    // log('Equal');
    if (userOutput.isNotEmpty && userOutput != '0') {
      needCalc = false;
      userInput = userOutput;
      userOutput = '';
      ref.read(inputValue.notifier).state = userInput.toCurrency();
      ref.read(outputValue.notifier).state = userOutput.toCurrency();
    } else {
      if (!needCalc) convert(userInput);
    }
  }

  void calc() {
    // log('process calc');
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = removeTrailingZero(eval).toString();
    // log('=========> $userOutput');
    ref.read(outputValue.notifier).state = userOutput.toCurrency();
  }

  void onBtnTapped(String button) {
    userInput += button;
    ref.read(inputValue.notifier).state = userInput.toCurrency();

    String lastVal = userInput.substring(userInput.length - 1);
    // log('last value = $lastVal');

    // If last value not number
    if (!['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'].contains(lastVal)) {
      // log('needCalc => true');
      needCalc = true;
    }

    // If last value is number & need calculation is true
    if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'].contains(lastVal) && needCalc) {
      calc();
    }

    // And then if last value is number
    if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'].contains(lastVal)) {
      // log('userOutput => $userOutput');
      // log('userInput => $userInput');
      if (userOutput.isNotEmpty && userOutput != '0') {
        // log('userOutput');
        convert(userOutput);
      } else {
        // log('userInput');
        convert(userInput);
      }
    }
  }

  /// is Operator Check
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }

  num removeTrailingZero(double val) {
    return val % 1 == 0 ? val.toInt() : val;
  }

  void convert(String value) {
    // log('process convert');
    double val = (double.tryParse(value) ?? 0) * ref.read(exchangeRateProvider);
    // log(value);
    // log(val.toString());
    var pattern = ref.read(baseCodeProvider) == 'IDR' ? '#,##0.##' : '#,##0.00000';
    exchangeOutput = removeTrailingZero(val).toCurrency(pattern: pattern).toString();
    // log(exchangeOutput);
    ref.read(exchangeValue.notifier).state = exchangeOutput == '0' ? '' : exchangeOutput;
  }

  void switchCurrency() {
    var tmpCode = ref.read(exchangeCodeProvider);
    var tmpBaseCode = ref.read(baseCodeProvider);
    ref.read(exchangeCodeProvider.notifier).state = tmpBaseCode;
    ref.read(baseCodeProvider.notifier).state = tmpCode;

    var tmpBaseRate = ref.read(baseRateProvider);
    if (tmpBaseCode == 'IDR') {
      // log('IDR => ${1 / tmpBaseRate}');
      ref.read(exchangeRateProvider.notifier).state = 1 / tmpBaseRate;
    } else {
      // log('IDR => ${1 * tmpBaseRate}');
      ref.read(exchangeRateProvider.notifier).state = 1 * tmpBaseRate;
    }
  }
}
