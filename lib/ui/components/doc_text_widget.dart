import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocTextWidget extends StatelessWidget {
  final String title;
  final String text;
  final FontWeight? font;

  const DocTextWidget({
    super.key,
    required this.title,
    required this.text,
    this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: text,
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
