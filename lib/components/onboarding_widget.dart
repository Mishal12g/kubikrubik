import 'package:flutter/material.dart';
import 'package:kubikrubik/helpers/colors_app.dart';

class OnboardingWidget extends StatelessWidget {
  final String imageNamed;
  final String title;

  const OnboardingWidget({
    super.key,
    required this.imageNamed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ColorsApp.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                  child: Image(
                image: AssetImage(imageNamed),
                fit: BoxFit.cover,
              )),
              const SizedBox(height: 12),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
