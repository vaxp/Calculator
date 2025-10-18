import 'package:get/get.dart';

class CalculatorController extends GetxController {
  // ✅ هذا المتغير التفاعلي (Observable) هو مصدر الحقيقة الوحيد للعرض.
  final display = '0'.obs;
  
  // ❌ تم حذف: final textController = TextEditingController(text: '0');

  double? _storedValue;
  String? _operator;
  bool _shouldClear = false; 

  void inputDigit(String d) {
    if (_shouldClear || display.value == '0') {
      display.value = d;
      _shouldClear = false;
    } else {
      display.value = '${display.value}$d';
    }
    // ❌ تم حذف: textController.text = display.value;
  }

  void inputDot() {
    if (_shouldClear) {
      display.value = '0.';
      _shouldClear = false;
      return;
    }
    if (!display.value.contains('.')) {
      display.value = '${display.value}.';
    }
    // ❌ تم حذف: textController.text = display.value;
  }

  void allClear() {
    display.value = '0';
    _storedValue = null;
    _operator = null;
    _shouldClear = false;
    // ❌ تم حذف: textController.text = display.value;
  }

  void toggleSign() {
    if (display.value == '0') return;
    if (display.value.startsWith('-')) {
      display.value = display.value.substring(1);
    } else {
      display.value = '-${display.value}';
    }
    // ❌ تم حذف: textController.text = display.value;
  }

  void percent() {
    final v = double.tryParse(display.value) ?? 0.0;
    display.value = _format(v / 100);
    _shouldClear = true;
    // ❌ تم حذف: textController.text = display.value;
  }

  void setOperator(String op) {
    final current = double.tryParse(display.value) ?? 0.0;
    if (_storedValue == null) {
      _storedValue = current;
    } else {
      // chain calculations
      _storedValue = _compute(_storedValue!, _operator, current);
      display.value = _format(_storedValue!);
    }
    _operator = op;
    _shouldClear = true;
    // ❌ تم حذف: textController.text = display.value;
  }

  void calculate() {
    if (_operator == null || _storedValue == null) return;
    final current = double.tryParse(display.value) ?? 0.0;
    final result = _compute(_storedValue!, _operator, current);
    display.value = _format(result);
    _storedValue = null;
    _operator = null;
    _shouldClear = true;
    // ❌ تم حذف: textController.text = display.value;
  }

  double _compute(double a, String? op, double b) {
    if (op == null) return b;
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '×':
      case '*':
        return a * b;
      case '÷':
      case '/':
        if (b == 0) return double.nan;
        return a / b;
      default:
        return b;
    }
  }

  String _format(double v) {
    if (v.isNaN) return 'Error';
    if (v % 1 == 0) return v.toInt().toString();
    return v.toString();
  }
}