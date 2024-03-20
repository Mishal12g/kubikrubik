import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';

class ChevroneRightIconWidget extends StatelessWidget {
  const ChevroneRightIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: ColorsApp.blueButton,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Image(
        image: AssetImage(AppImages.roundAltArrowRight),
      ),
    );
  }
}
