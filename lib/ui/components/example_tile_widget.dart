import 'package:flutter/material.dart';

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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(fontSize: 12),
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
