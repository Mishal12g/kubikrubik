import 'package:get/get_state_manager/get_state_manager.dart';

class OnboardingController extends GetxController {
  int _currentIndex = 0;

  final _images = <String>[
    'images/onboarding1.png',
    'images/onboarding2.png',
    'images/onboarding3.png',
  ];

  final _strings = <String>[
    "Устройство кубика Рубика и язык вращений кубика",
    "Подробное описание популярных методов решения кубика",
    "Каталог ваших кубиков и удобный таймер для вашей тренировки"
  ];

  String getImage() {
    return _images[_currentIndex];
  }

  String getText() {
    return _strings[_currentIndex];
  }

  increment() {
    if (_currentIndex != 2) _currentIndex++;
    update();
  }
}
