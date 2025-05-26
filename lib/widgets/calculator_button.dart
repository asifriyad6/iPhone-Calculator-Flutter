import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color textColor;
  const CalculatorButton({
    super.key,
    required this.label,
    this.onTap,
    this.bgColor = const Color(0xFF505050),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
