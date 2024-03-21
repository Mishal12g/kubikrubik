import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? color;

  final Text text;
  final Function onTap;
  final double? widthBorder;

  const ButtonWidget({
    super.key,
    this.color,
    required this.text,
    required this.onTap,
    this.widthBorder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // Цвет рамки
            width: widthBorder ?? 1.0,
          ),
          color: color,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: text,
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
