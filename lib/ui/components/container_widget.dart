import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';

class ContainerWidget extends StatelessWidget {
  final Widget widget;
  const ContainerWidget({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: widget,
    );
  }
}
