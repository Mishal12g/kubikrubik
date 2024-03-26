import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleTileWidget extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const ExampleTileWidget({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 12),
        Image(
          image: AssetImage(image),
        ),
      ],
    );
  }
}
