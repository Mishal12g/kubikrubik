import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';

class ContainerWidget extends StatelessWidget {
  final Widget widget;
  final EdgeInsets? edgeInsets;
  const ContainerWidget({
    super.key,
    required this.widget,
    this.edgeInsets = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: edgeInsets,
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: widget,
    );
  }
}
