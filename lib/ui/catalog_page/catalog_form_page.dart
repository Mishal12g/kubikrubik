import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kubikrubik/models/catalog.dart';
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

    final TextEditingController nameController = TextEditingController();
    final TextEditingController sizeController = TextEditingController();
    final TextEditingController commentController = TextEditingController();

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
                        controller: nameController,
                        text: "Название",
                        hintText: "Новый кубик",
                      ),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        formatterText: FilteringTextInputFormatter.digitsOnly,
                        controller: sizeController,
                        text: "Размер",
                        hintText: "3*3",
                        widget: _PopUpSize(sizeController),
                      ),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        controller: commentController,
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
                      name: nameController.text,
                      size: sizeController.text,
                      comment: commentController.text.isNotEmpty
                          ? commentController.text
                          : null,
                      photo: null,
                    );

                    if (nameController.text.isNotEmpty &&
                        sizeController.text.isNotEmpty) {
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

class _PopUpSize extends StatelessWidget {
  final TextEditingController sizeController;
  const _PopUpSize(this.sizeController);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      icon: const Image(
        image: AssetImage(AppImages.popUpClose),
      ),
      onSelected: (SampleItem item) {
        switch (item) {
          case SampleItem.itemOne:
            sizeController.text = "2*2";
          case SampleItem.itemTwo:
            sizeController.text = "3*3";
          case SampleItem.itemThree:
            sizeController.text = "4*4";
          case SampleItem.other:
            sizeController.text = "Другое";
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Item 1'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Item 2'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Item 3'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.other,
          child: Text('Другое'),
        ),
      ],
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

enum SampleItem {
  itemOne,
  itemTwo,
  itemThree,
  other,
}
