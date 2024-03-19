import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String image;
  final Function onTap;

  const TileWidget({
    super.key,
    required this.color,
    required this.image,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
