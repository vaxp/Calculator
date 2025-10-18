import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'app/bindings/calculator_binding.dart';
import 'app/views/calculator_view.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Calculator');
    const fixedSize = Size(405, 700); 
    setWindowMinSize(fixedSize);
    setWindowMaxSize(fixedSize);
  }

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
