import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_detail_page/algorithms_detail_page_controller.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';

class AlgorithmsDetailPage extends StatelessWidget {
  const AlgorithmsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments as int;
    final list = ["Метод слоями", "Метод CFOP", "Метод Roux"];
    final c = AlgorihmsDetailPageController();

    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Image(
                        width: double.infinity,
                        fit: BoxFit.contain,
                        image: AssetImage(c.details[index].image),
                      ),
                      const Positioned.fill(
                        child: Center(
                          child: Image(
                            image: AssetImage(AppImages.play),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ContainerWidget(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.details[index].title,
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          c.details[index].text,
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
