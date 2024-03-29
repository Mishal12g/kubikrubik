import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/chevrine_right_icon_widget.dart';
import 'package:kubikrubik/ui/components/tile_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Кубик Рубика",
                      style: GoogleFonts.rubik(
                        color: ColorsApp.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          const _JuniorTileWidget(),
                          const SizedBox(height: 40),
                          TileWidget(
                            title: 'Алгоритмы',
                            color: ColorsApp.blueTile,
                            image: AppImages.algoritm,
                            onTap: () {
                              Get.toNamed("/algorithms_page");
                            },
                          ),
                          const SizedBox(height: 12),
                          TileWidget(
                            title: 'Каталог',
                            color: ColorsApp.yellowTile,
                            image: AppImages.catalog,
                            onTap: () {
                              Get.toNamed("/catalog_page");
                            },
                          ),
                          const SizedBox(height: 12),
                          TileWidget(
                            title: 'Таймер',
                            color: ColorsApp.greenTile,
                            image: AppImages.timer,
                            onTap: () {
                              Get.toNamed("/timer_page");
                            },
                          ),
                          const SizedBox(height: 40),
                          TileWidget(
                            title: 'Настройки',
                            color: ColorsApp.greyTile,
                            image: AppImages.settings,
                            onTap: () {
                              Get.toNamed("/settings_page");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _JuniorTileWidget extends StatelessWidget {
  const _JuniorTileWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: ColorsApp.white),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(image: AssetImage(AppImages.kubik)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Устройство кубика Рубика",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: ColorsApp.blueButton),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(AppImages.hourglass),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "10 минут",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const ChevroneRightIconWidget()
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.toNamed("/junior_page");
              },
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
