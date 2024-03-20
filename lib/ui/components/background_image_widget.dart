import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/resources.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(AppImages.onboarding),
      ),
    );
  }
}
