import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'app/bindings/calculator_binding.dart';
import 'app/views/calculator_view.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CalculatorBinding(),
      home: const CalculatorView(),
    );
  }
}
