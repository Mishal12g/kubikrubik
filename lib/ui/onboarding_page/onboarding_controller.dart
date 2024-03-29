import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/services/onboarding.dart';

class OnboardingController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final _images = <String>[
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
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

  hideOnboarding() {
    OnboardingService.hide();
  }
}
