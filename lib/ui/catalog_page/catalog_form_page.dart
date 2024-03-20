import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';

class CatalogFormPage extends StatelessWidget {
  const CatalogFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        title: const Text("Новый кубик"),
      ),
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                ContainerWidget(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 179,
                            height: 179,
                            decoration: BoxDecoration(
                                color: ColorsApp.blueButton,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(AppImages.addPhoto),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const FormTextFieldWidget(
                        text: "Название",
                        hintText: "Новый кубик",
                      ),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        text: "Размер",
                        hintText: "3*3",
                        widget: IconButton(
                          icon: const Image(
                            image: AssetImage(AppImages.popUpClose),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 12),
                      const FormTextFieldWidget(
                        text: "Комментарий",
                        hintText: "Новый кубик",
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
