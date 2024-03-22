import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/resources.dart';

class TimerButtonWidget extends StatelessWidget {
  final Function action;
  final bool isPlay;
  const TimerButtonWidget({
    super.key,
    required this.isPlay,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => action(),
      icon: Container(
        width: 133,
        height: 133,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(76, 171, 237, 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: const Color.fromRGBO(53, 94, 238, 1),
            ),
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(217, 198, 236, 250),
          ),
          child: Center(
            child: Image(
                image: AssetImage(
                    !isPlay ? AppImages.playTwo : AppImages.stopTwo)),
          ),
        ),
      ),
    );
  }
}
