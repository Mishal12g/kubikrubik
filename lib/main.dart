import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_detail_page/algorithms_detail_page.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_page.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_form_page.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page.dart';
import 'package:kubikrubik/ui/junior_page/junior_details_page.dart';
import 'package:kubikrubik/ui/junior_page/junior_page.dart';
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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(49, 34, 218, 0.665),
            foregroundColor: Colors.white,
            titleTextStyle:
                TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const OnboardingScreen(),
        "/main_page": (context) => const MainPage(),
        "/junior_page": (context) => const JuniorPage(),
        "/junior_details_page": (context) => const JuniorDetailsPage(),
        "/algorithms_page": (context) => const AlgorithmsPage(),
        "/algorithms_detail_page": (context) => const AlgorithmsDetailPage(),
        "/catalog_page": (context) => const CatalogPage(),
        "/catalog_form_page": (context) => const CatalogFormPage(),
      },
    );
  }
}
