import 'package:flutter/cupertino.dart';

typedef CalcTap = void Function();

class CalcButton extends StatelessWidget {
  final String label;
  final Color? color;
  final CalcTap? onTap;
  final double flex;

  const CalcButton({
    super.key,
    required this.label,
    this.color,
    this.onTap,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final bg = color ?? CupertinoColors.systemGrey.withOpacity(0.1);

    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CupertinoButton(
          padding: const EdgeInsets.all(18),
          color: bg,
          borderRadius: BorderRadius.circular(12),
          onPressed: onTap,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(221, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
