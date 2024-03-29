import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_detail_page/algorithms_detail_page.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_page.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_edit_form_page.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_form_page.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page.dart';
import 'package:kubikrubik/ui/junior_page/junior_details_page.dart';
import 'package:kubikrubik/ui/junior_page/junior_page.dart';
import 'package:kubikrubik/ui/main_page/main_page.dart';
import 'package:kubikrubik/ui/onboarding_page/onboarding_page.dart';
import 'package:kubikrubik/ui/records_page/records_page.dart';
import 'package:kubikrubik/ui/settings_page/settings_page.dart';
import 'package:kubikrubik/ui/splash_page/splash_page.dart';
import 'package:kubikrubik/ui/timer_page/timer_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color.fromRGBO(49, 34, 218, 0.665),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/onboarding_page": (context) => const OnboardingPage(),
        "/main_page": (context) => const MainPage(),
        "/junior_page": (context) => const JuniorPage(),
        "/junior_details_page": (context) => const JuniorDetailsPage(),
        "/algorithms_page": (context) => const AlgorithmsPage(),
        "/algorithms_detail_page": (context) => const AlgorithmsDetailPage(),
        "/catalog_page": (context) => const CatalogPage(),
        "/catalog_form_page": (context) => const CatalogFormPage(),
        "/timer_page": (context) => const TimerPage(),
        "/records_page": (context) => RecordsPage(),
        "/settings_page": (context) => const SettingsPage(),
        "/catalog_edit_form_page": (context) => const CatalogEditFormPage(),
      },
    );
  }
}
