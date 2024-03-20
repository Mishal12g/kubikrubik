import 'package:flutter/material.dart';
import 'package:kubikrubik/ui/components/chevrine_right_icon_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';

class AlgorithmsTileWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  const AlgorithmsTileWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ContainerWidget(
        widget: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const ChevroneRightIconWidget()
          ],
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
