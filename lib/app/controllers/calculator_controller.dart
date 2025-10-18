import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final display = '0'.obs;
  final equation = ''.obs;

  double? _storedValue;
  String? _operator;
  bool _shouldClear = false; 

  void _updateEquation() {
    if (_storedValue != null && _operator != null) {
      equation.value = '${_format(_storedValue!)} $_operator ${display.value}';
    } else {
      equation.value = display.value;
    }
  }

  void inputDigit(String d) {
    if (_shouldClear || display.value == '0') {
      display.value = d;
      _shouldClear = false;
    } else {
      display.value = '${display.value}$d';
    }
    _updateEquation(); 
  }

  void inputDot() {
    if (_shouldClear) {
      display.value = '0.';
      _shouldClear = false;
      _updateEquation(); 
      return;
    }
    if (!display.value.contains('.')) {
      display.value = '${display.value}.';
    }
    _updateEquation();
    }

  void allClear() {
    display.value = '0';
    equation.value = '';
    _storedValue = null;
    _operator = null;
    _shouldClear = false;
  }

  void toggleSign() {
    if (display.value == '0') return;
    if (display.value.startsWith('-')) {
      display.value = display.value.substring(1);
    } else {
      display.value = '-${display.value}';
    }
    _updateEquation();
  }

  void percent() {
    final v = double.tryParse(display.value) ?? 0.0;
    display.value = _format(v / 100);
    _shouldClear = true;
    _updateEquation();
  }

  void setOperator(String op) {
    final current = double.tryParse(display.value) ?? 0.0;
    if (_storedValue == null) {
      _storedValue = current;
    } else {
      _storedValue = _compute(_storedValue!, _operator, current);

      display.value = _format(_storedValue!);
    }
    _operator = op;
    _shouldClear = true;
    _updateEquation(); 
  }

  void calculate() {
    if (_operator == null || _storedValue == null) return;
    final current = double.tryParse(display.value) ?? 0.0;
    final result = _compute(_storedValue!, _operator, current);
    
    final finalEquation = '${_format(_storedValue!)} $_operator ${display.value}';
    
    display.value = _format(result);
    equation.value = finalEquation; 
    
    _storedValue = null;
    _operator = null;
    _shouldClear = true;
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
    return v.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }
}