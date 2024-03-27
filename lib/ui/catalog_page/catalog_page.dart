import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/enums/catalog_pop_up.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/catalog_page/catalog_page_controller.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/timer_page/timer_page_controller.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CatalogPageController());
    Get.lazyPut(() => TimerPageController());
    CatalogPageController c = Get.find<CatalogPageController>();
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
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: c.catalogs.length,
                                  itemBuilder: (context, index) {
                                    final catalog = c.catalogs[index];

                                    return Column(
                                      children: [
                                        if (index == 0)
                                          const SizedBox(height: 20),
                                        _CatalogTileWidget(
                                          name: catalog.name,
                                          size: catalog.size,
                                          image: catalog.image,
                                          button: _EditAndDeleteCatalogPopUP(
                                            deleteOnTap: () async {
                                              await _showDeleteCatalogAlertDialog(
                                                  context, index, catalog);
                                            },
                                            editOnTap: () {
                                              Get.toNamed(
                                                  "/catalog_edit_form_page",
                                                  arguments: catalog);
                                            },
                                          ),
                                          onTap: () async {
                                            await _showAlertDetailsCatalog(
                                                context, catalog);
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SafeArea(child: _AddCatalogButtonWidget()),
                              const SizedBox(height: 12),
                            ],
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

  Future<dynamic> _showDeleteCatalogAlertDialog(
      BuildContext context, int index, Catalog catalog) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorsApp.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        title: Center(
          child: Text(
            "Удалить",
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: ColorsApp.redAccent,
            ),
          ),
        ),
        content: Text(
          "Вы действительно хотите удалить “${catalog.name}”?",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                    text: Text(
                      "Закрыть",
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    }),
              ),
              const SizedBox(width: 23),
              Expanded(
                child: ButtonWidget(
                  widthBorder: 0,
                  color: ColorsApp.redAccent,
                  text: Text(
                    "Удалить",
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Get.find<CatalogPageController>().deleteCatalog(catalog);
                    Get.find<TimerPageController>().loadCatalogs();

                    Get.back();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showAlertDetailsCatalog(
      BuildContext context, Catalog catalog) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              surfaceTintColor: Colors.transparent,
              backgroundColor: ColorsApp.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
              content: Builder(
                builder: (context) {
                  var width = MediaQuery.of(context).size.width;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: width,
                        child: _CatalogTileWidget(
                          edgeInsets: const EdgeInsets.all(0),
                          name: catalog.name,
                          size: catalog.size,
                          image: catalog.image,
                          button: IconButton(
                            icon: const Image(
                              image: AssetImage(AppImages.edit),
                            ),
                            onPressed: () {
                              Get.back();
                              Get.toNamed("/catalog_edit_form_page",
                                  arguments: catalog);
                            },
                          ),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        color: ColorsApp.blueButton,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              catalog.comment ?? "Пусто",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              actions: [
                ButtonWidget(
                    color: ColorsApp.blue,
                    text: Text(
                      "Закрыть",
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    })
              ],
            ));
  }
}

class _AddCatalogButtonWidget extends StatelessWidget {
  const _AddCatalogButtonWidget();

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      color: ColorsApp.blue,
      text: Text(
        "Добавить новый",
        style: GoogleFonts.rubik(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
      ),
      onTap: () {
        Get.toNamed("/catalog_form_page");
      },
    );
  }
}

class _CatalogTileWidget extends StatelessWidget {
  final Uint8List? image;
  final String name;
  final String size;
  final Function onTap;
  final Widget? button;
  final EdgeInsets? edgeInsets;

  const _CatalogTileWidget({
    this.image,
    required this.name,
    required this.size,
    required this.onTap,
    this.button,
    this.edgeInsets,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ContainerWidget(
        edgeInsets: edgeInsets ?? const EdgeInsets.all(12),
        widget: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: ColorsApp.greyTile,
                borderRadius: BorderRadius.circular(100),
              ),
              child: image != null
                  ? Center(
                      child: ClipOval(
                        child: Image.memory(
                          image ?? Uint8List(0),
                          fit: BoxFit.cover,
                          width: 179,
                          height: 179,
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage(AppImages.cube1),
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    size,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            button ?? const SizedBox(),
          ],
        ),
      ),
      onTap: () => onTap(),
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
        PopupMenuItem<CatalogPopUp>(
          value: CatalogPopUp.edit,
          child: Text(
            'Редактировать',
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        PopupMenuItem<CatalogPopUp>(
          value: CatalogPopUp.delete,
          child: Text(
            'Уалить',
            style: GoogleFonts.rubik(
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
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
                    Text(
                      "Ваш каталог пуст. ",
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Нажмите здесь,",
                        style: GoogleFonts.rubik(
                            color: ColorsApp.yellowButton,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsApp.yellowButton),
                      ),
                      onTap: () {
                        Get.toNamed("/catalog_form_page");
                      },
                    ),
                  ],
                ),
                Text(
                  "чтобы добавить новый кубик",
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
