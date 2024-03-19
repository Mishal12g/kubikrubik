import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kubikrubik/ui/main_page/main_page.dart';
import 'package:kubikrubik/ui/onboarding/onboarding_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const OnboardingScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => const OnboardingScreen(),
        "/main_page": (context) => const MainPage(),
      },
    );
  }
}
