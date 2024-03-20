import 'package:flutter/material.dart';

class DiviceCubeTileWidget extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const DiviceCubeTileWidget({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage(image)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(text)
            ],
          ),
        )
      ],
    );
  }
}
