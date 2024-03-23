import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPageController extends GetxController {
  launchURL() async {
    const url = 'https://www.google.ru/'; // Замените на вашу ссылку
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }

  appReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
