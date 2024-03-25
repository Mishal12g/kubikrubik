import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/services/onboarding.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    nabigateToHome();
  }

  nabigateToHome() {
    final String page = !OnboardingService.isHiddenOnboarding()
        ? "/onboarding_page"
        : "/main_page";

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.of(context).pushReplacementNamed(page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          BackgroundImageWidget(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 85,
                  height: 85,
                  image: AssetImage(AppImages.kubik),
                ),
                SizedBox(height: 12),
                Text(
                  "Кубик Рубика",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
