import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'app/bindings/calculator_binding.dart';
import 'app/views/calculator_view.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize window manager for desktop controls
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 700),
    center: true,
    titleBarStyle: TitleBarStyle.hidden, // يخفي شريط مدير النوافذ
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });



  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isLinux) {
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
