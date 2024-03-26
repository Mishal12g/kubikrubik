import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/enums/sample_item.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page_controller.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';
import 'package:kubikrubik/ui/timer_page/timer_page_controller.dart';

class CatalogEditFormPage extends StatelessWidget {
  const CatalogEditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CatalogPageController>();

    final catalog = Get.arguments as Catalog;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController sizeController = TextEditingController();
    final TextEditingController commentController = TextEditingController();
    nameController.text = catalog.name;
    sizeController.text = catalog.size;
    commentController.text = catalog.comment ?? "";

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
                      GetBuilder<CatalogPageController>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (c.image == null)
                              _AvatarImageWidget(image: catalog.image, c: c),
                            if (c.image != null)
                              _AvatarImageWidget(image: c.image, c: c),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        controller: nameController,
                        text: "Название",
                        hintText: "Новый кубик",
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      _PopUpSize(sizeController),
                      const SizedBox(height: 12),
                      FormTextFieldWidget(
                        controller: commentController,
                        text: "Комментарий",
                        hintText: "Новый кубик",
                        height: 100,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _SaveCatalogButtonWidget(
                  onTap: () {
                    final editCatalog = Catalog(
                      name: nameController.text,
                      size: sizeController.text,
                      comment: commentController.text.isNotEmpty
                          ? commentController.text
                          : null,
                      image: c.image,
                      id: catalog.id,
                    );

                    if (nameController.text.isNotEmpty &&
                        sizeController.text.isNotEmpty) {
                      c.editCatalog(editCatalog);
                      Get.find<TimerPageController>().loadCatalogs();
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

class _AvatarImageWidget extends StatelessWidget {
  final Uint8List? image;
  final CatalogPageController c;

  const _AvatarImageWidget({
    required this.image,
    required this.c,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 179,
      height: 179,
      decoration: BoxDecoration(
          color: ColorsApp.blueButton,
          borderRadius: BorderRadius.circular(100)),
      child: image != null
          ? Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.memory(
                    image!,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: IconButton(
                      icon: const Image(
                        image: AssetImage(
                          AppImages.addPhoto,
                        ),
                      ),
                      onPressed: () {
                        c.getImage();
                      },
                    ),
                  ),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                c.getImage();
              },
              icon: const Image(
                image: AssetImage(AppImages.addPhoto),
              ),
            ),
    );
  }
}

class _PopUpSize extends StatelessWidget {
  final TextEditingController sizeController;
  const _PopUpSize(this.sizeController);

  @override
  Widget build(BuildContext context) {
    return FormTextFieldWidget(
      controller: sizeController,
      readOnly: true,
      hintText: '3*3',
      text: 'Размер',
      widget: const Image(
        width: 24,
        height: 24,
        image: AssetImage(AppImages.popUpClose),
      ),
      onTap: () {
        final RenderBox textFieldRenderBox =
            context.findRenderObject() as RenderBox;
        final textFieldPosition = textFieldRenderBox.localToGlobal(Offset.zero);

        showMenu(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          context: context,
          position: RelativeRect.fromLTRB(
            textFieldPosition.dx + textFieldRenderBox.size.width,
            textFieldPosition.dy + textFieldRenderBox.size.height,
            35,
            textFieldPosition.dy + textFieldRenderBox.size.height * 2,
          ),
          items: [
            const PopupMenuItem(
              value: SampleItem.itemOne,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2*2'),
                  Image(image: AssetImage(AppImages.popUpOpen))
                ],
              ),
            ),
            const PopupMenuItem(
              value: SampleItem.itemTwo,
              child: Text('3*3'),
            ),
            const PopupMenuItem(
              value: SampleItem.itemThree,
              child: Text('4*4'),
            ),
            const PopupMenuItem(
              value: SampleItem.other,
              child: Text('Другое'),
            ),
          ],
        ).then((value) {
          if (value != null) {
            switch (value) {
              case SampleItem.itemOne:
                sizeController.text = "2*2";
                break;
              case SampleItem.itemTwo:
                sizeController.text = "3*3";
                break;
              case SampleItem.itemThree:
                sizeController.text = "4*4";
                break;
              case SampleItem.other:
                sizeController.text = "Другое";
                break;
            }
          }
        });
      },
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
      text: Text(
        "Сохранить",
        style: GoogleFonts.rubik(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 17.0,
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
