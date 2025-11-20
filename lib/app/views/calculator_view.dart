import 'package:calculator/venom_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';
import '../widgets/calc_button.dart';

class CalculatorView extends GetView<CalculatorController> {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return VenomScaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => Text(
                      controller.equation.value, 
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        inherit: false,
                        fontSize: 20, 
                        fontWeight: FontWeight.w400,
                        color: Colors.white70, 
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.display.value, 
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        inherit: false,
                        fontSize: 52, 
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              children: [
                Row(children: [
                  CalcButton(label: 'AC', color: CupertinoColors.systemGrey, onTap: controller.allClear),
                  CalcButton(label: '+/-', color: CupertinoColors.systemGrey, onTap: controller.toggleSign),
                  CalcButton(label: '%', color: CupertinoColors.systemGrey, onTap: controller.percent),
                  CalcButton(label: '÷', color: const Color.fromARGB(255, 57, 0, 104), onTap: () => controller.setOperator('÷')),
                ]),
                Row(children: [
                  CalcButton(label: '7', onTap: () => controller.inputDigit('7')),
                  CalcButton(label: '8', onTap: () => controller.inputDigit('8')),
                  CalcButton(label: '9', onTap: () => controller.inputDigit('9')),
                  CalcButton(label: '×', color: const Color.fromARGB(255, 57, 0, 104), onTap: () => controller.setOperator('×')),
                ]),
                Row(children: [
                  CalcButton(label: '4', onTap: () => controller.inputDigit('4')),
                  CalcButton(label: '5', onTap: () => controller.inputDigit('5')),
                  CalcButton(label: '6', onTap: () => controller.inputDigit('6')),
                  CalcButton(label: '-', color: const Color.fromARGB(255, 57, 0, 104), onTap: () => controller.setOperator('-')),
                ]),
                Row(children: [
                  CalcButton(label: '1', onTap: () => controller.inputDigit('1')),
                  CalcButton(label: '2', onTap: () => controller.inputDigit('2')),
                  CalcButton(label: '3', onTap: () => controller.inputDigit('3')),
                  CalcButton(label: '+', color: const Color.fromARGB(255, 57, 0, 104), onTap: () => controller.setOperator('+')),
                ]),
                Row(children: [
                  CalcButton(label: '0', flex: 2, onTap: () => controller.inputDigit('0')),
                  CalcButton(label: '.', onTap: controller.inputDot),
                  CalcButton(label: '=', color: const Color.fromARGB(255, 57, 0, 104), onTap: controller.calculate),
                ]),
              ],
            ),
          )
        ],
      ), 
    );
  }
}