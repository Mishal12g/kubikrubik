import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/UI/components/onboarding_widget.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/services/settings_service.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/onboarding_page/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController c = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: ColorsApp.secondBackground,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 98,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      GetBuilder<OnboardingController>(
                        builder: (_) => OnboardingWidget(
                          imageNamed: c.getImage(),
                          title: c.getText(),
                        ),
                      ),
                      const SizedBox(height: 38),
                      const Column(
                        children: [
                          _OnboardingButtonsWidget(),
                          _ReferenceButtonsWidget()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ReferenceButtonsWidget extends StatelessWidget {
  const _ReferenceButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            SettingsService.termsAndAgreement();
          },
          child: Text(
            "Условия использования",
            style: GoogleFonts.rubik(
              color: ColorsApp.grey,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ),
        Container(
          width: 1,
          height: 12,
          color: ColorsApp.grey,
        ),
        TextButton(
          onPressed: () {
            SettingsService.launchURL();
          },
          child: Text(
            "Политика конфиденциальности",
            style: GoogleFonts.rubik(
              color: ColorsApp.grey,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingButtonsWidget extends StatelessWidget {
  const _OnboardingButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ButtonWidget(
            text: Text(
              "Пропустить",
              style: GoogleFonts.rubik(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            color: ColorsApp.white,
            onTap: () {
              hideOnboarding();
            },
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: ButtonWidget(
            text: Text(
              "Далее",
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            color: ColorsApp.blue,
            onTap: () {
              if (Get.find<OnboardingController>().currentIndex == 2) {
                hideOnboarding();
              }
              Get.find<OnboardingController>().increment();
            },
          ),
        )
      ],
    );
  }

  hideOnboarding() {
    Get.find<OnboardingController>().hideOnboarding();
    Get.toNamed("/main_page");
  }
}
