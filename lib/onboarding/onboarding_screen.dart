import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:kubikrubik/components/button_widget.dart';
import 'package:kubikrubik/components/onboarding_widget.dart';
import 'package:kubikrubik/helpers/colors_app.dart';
import 'package:kubikrubik/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController c = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("images/onboarding.png"),
            ),
          ),
          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 98,
                  left: 20,
                  right: 20,
                  bottom: 40,
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
          onPressed: () {},
          child: const Text(
            "Условия использования",
            style: TextStyle(fontSize: 10, color: ColorsApp.grey),
          ),
        ),
        Container(
          width: 1,
          height: 12,
          color: ColorsApp.grey,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Политика конфиденциальности",
            style: TextStyle(fontSize: 10, color: ColorsApp.grey),
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
            text: const Text(
              "Пропустить",
            ),
            color: ColorsApp.white,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: ButtonWidget(
            text: const Text(
              "Далее",
              style: TextStyle(color: ColorsApp.white),
            ),
            color: ColorsApp.blue,
            onTap: () {
              Get.find<OnboardingController>().increment();
            },
          ),
        )
      ],
    );
  }
}
