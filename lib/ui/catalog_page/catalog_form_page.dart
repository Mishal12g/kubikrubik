import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page_controller.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';

class CatalogFormPage extends StatelessWidget {
  const CatalogFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CatalogPageController>();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _sizeController = TextEditingController();
    final TextEditingController _commentController = TextEditingController();

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
                      FormTextFieldWidget(
                        controller: _nameController,
                        text: "Название",
                        hintText: "Новый кубик",
                      ),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        controller: _sizeController,
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
                      FormTextFieldWidget(
                        controller: _commentController,
                        text: "Комментарий",
                        hintText: "Новый кубик",
                        height: 100,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _SaveCatalogButtonWidget(
                  onTap: () {
                    final catalog = Catalog(
                      name: _nameController.text,
                      size: _sizeController.text,
                      comment: _commentController.text.isNotEmpty
                          ? _commentController.text
                          : null,
                      photo: null,
                    );

                    if (_nameController.text.isNotEmpty &&
                        _sizeController.text.isNotEmpty) {
                      c.addCatalog(catalog);
                      Get.back();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SaveCatalogButtonWidget extends StatelessWidget {
  final Function onTap;
  const _SaveCatalogButtonWidget({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      color: ColorsApp.blue,
      text: const Text(
        "Сохранить",
        style: TextStyle(color: Colors.white),
      ),
      onTap: () => onTap(),
    );
  }
}
