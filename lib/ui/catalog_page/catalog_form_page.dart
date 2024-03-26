import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:uuid/uuid.dart';

class CatalogFormPage extends StatefulWidget {
  const CatalogFormPage({super.key});

  @override
  State<CatalogFormPage> createState() => _CatalogFormPageState();
}

class _CatalogFormPageState extends State<CatalogFormPage> {
  @override
  void dispose() {
    super.dispose();
    final c = Get.find<CatalogPageController>();
    c.image = null;
  }

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
                          GetBuilder<CatalogPageController>(
                            builder: (controller) => Container(
                              width: 179,
                              height: 179,
                              decoration: BoxDecoration(
                                  color: ColorsApp.blueButton,
                                  borderRadius: BorderRadius.circular(100)),
                              child: c.image != null
                                  ? Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.memory(
                                            c.image!,
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
                                              onPressed: () async {
                                                await _showModalBottomSheet(
                                                    context, c);
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : IconButton(
                                      onPressed: () async {
                                        await _showModalBottomSheet(context, c);
                                      },
                                      icon: const Image(
                                        image: AssetImage(AppImages.addPhoto),
                                      )),
                            ),
                          ),
                        ],
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
                    final catalog = Catalog(
                      name: nameController.text,
                      size: sizeController.text,
                      comment: commentController.text.isNotEmpty
                          ? commentController.text
                          : null,
                      image: c.image,
                      id: const Uuid().v4(),
                    );

                    if (nameController.text.isNotEmpty &&
                        sizeController.text.isNotEmpty) {
                      c.addCatalog(catalog);
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

  Future<dynamic> _showModalBottomSheet(
      BuildContext context, CatalogPageController c) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        height: 250,
        child: AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Column(
                children: [
                  ButtonWidget(
                    color: ColorsApp.blueButton,
                    text: const Text("Камера"),
                    onTap: () {
                      Get.back();
                      c.getImage(ImageSource.camera);
                    },
                  ),
                  const SizedBox(height: 12),
                  ButtonWidget(
                    color: ColorsApp.blueButton,
                    text: const Text("Галерея"),
                    onTap: () {
                      Get.back();
                      c.getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          ),
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
