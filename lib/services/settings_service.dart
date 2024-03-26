import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsService {
  static launchURL() async {
    const url = 'https://www.google.ru/'; // Замените на вашу ссылку
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }

  static termsAndAgreement() async {
    const url = 'https://www.google.ru/'; // Замените на вашу ссылку
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }

  static Future<void> appReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }
}
