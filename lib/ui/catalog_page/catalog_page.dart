import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/enums/catalog_pop_up.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page_controller.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    CatalogPageController c = Get.put(CatalogPageController());

    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        title: const Text("Каталог"),
      ),
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          GetBuilder<CatalogPageController>(
            builder: (_) {
              return c.catalogs.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(height: 117),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: _EmptyStateCatalogWidget()),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: [
                          ListView.builder(
                            itemCount: c.catalogs.length,
                            itemBuilder: (context, index) {
                              final catalog = c.catalogs[index];

                              return Column(
                                children: [
                                  _CatalogTileWidget(
                                    index: index,
                                    name: catalog.name,
                                    size: catalog.size,
                                    image: catalog.photo,
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              );
                            },
                          ),
                          const Positioned(
                            bottom: 40,
                            left: 0,
                            right: 0,
                            child: _AddCatalogButtonWidget(),
                          ),
                        ],
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}

class _AddCatalogButtonWidget extends StatelessWidget {
  const _AddCatalogButtonWidget();

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      color: ColorsApp.blue,
      text: const Text(
        "Добавить новый",
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        Get.toNamed("/catalog_form_page");
      },
    );
  }
}

class _CatalogTileWidget extends StatelessWidget {
  final int? index;
  final String? image;
  final String name;
  final String size;
  final Function onTap;

  const _CatalogTileWidget({
    this.index,
    this.image,
    required this.name,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: ColorsApp.greyTile,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image(
              image: AssetImage(image ?? AppImages.cube1),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(size),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _EditAndDeleteCatalogPopUP(
            deleteOnTap: () {
              if (index != null) {
                Get.find<CatalogPageController>().deleteCatalog(index ?? 0);
              }
            },
            editOnTap: () {
              //TODO: edit
            },
          ),
        ],
      ),
    );
  }
}

class _EditAndDeleteCatalogPopUP extends StatelessWidget {
  final Function deleteOnTap;
  final Function editOnTap;
  const _EditAndDeleteCatalogPopUP({
    required this.deleteOnTap,
    required this.editOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CatalogPopUp>(
      icon: const Icon(
        Icons.more_horiz,
        color: ColorsApp.blue,
      ),
      color: Colors.white,
      onSelected: (item) {
        switch (item) {
          case CatalogPopUp.delete:
            deleteOnTap();
          case CatalogPopUp.edit:
            editOnTap();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<CatalogPopUp>>[
        const PopupMenuItem<CatalogPopUp>(
          value: CatalogPopUp.edit,
          child: Text('Редактировать'),
        ),
        const PopupMenuItem<CatalogPopUp>(
          value: CatalogPopUp.delete,
          child: Text(
            'Уалить',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
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
