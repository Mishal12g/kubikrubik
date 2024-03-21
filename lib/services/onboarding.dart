import 'package:hive/hive.dart';

class OnboardingService {
  static bool isHiddenOnboarding() {
    final box = Hive.box<bool>("Onboarding");
    final isHidden = box.get("isHidden") ?? false;

    return isHidden;
  }

  static hide() async {
    final box = Hive.box<bool>("Onboarding");
    await box.put("isHidden", true);
  }
}
