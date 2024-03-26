import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/services/hive_initialization.dart';
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
    HiveInitialization.initHive().then((_) {
      nabigateToHome();
    });
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
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: 85,
                  height: 85,
                  image: AssetImage(AppImages.kubik),
                ),
                const SizedBox(height: 12),
                Text(
                  "Кубик Рубика",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
