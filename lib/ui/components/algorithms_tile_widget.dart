import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
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
