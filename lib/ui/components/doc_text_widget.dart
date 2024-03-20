import 'package:flutter/material.dart';

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
            style: TextStyle(
              fontWeight: font,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
