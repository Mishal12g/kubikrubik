import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        title: const Text("Каталог"),
      ),
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          ListView(
            children: const [
              SizedBox(height: 117),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _EmptyStateCatalogWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyStateCatalogWidget extends StatelessWidget {
  const _EmptyStateCatalogWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsApp.blueButton),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Image(
              image: AssetImage(AppImages.catalogEmptyState),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ваш каталог пуст. ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Нажмите здесь,",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.yellowButton,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsApp.yellowButton),
                      ),
                      onTap: () {
                        Get.toNamed("/catalog_form_page");
                      },
                    ),
                  ],
                ),
                const Text(
                  "чтобы добавить новый кубик",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
