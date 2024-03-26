import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/doc_text_widget.dart';

class JuniorPage extends StatelessWidget {
  const JuniorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Устройство кубика Рубика"),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: const [
                SizedBox(height: 12),
                Image(
                  width: 227,
                  height: 227,
                  image: AssetImage(AppImages.kubik),
                  fit: BoxFit.contain,
                ),
                Column(
                  children: [
                    _OneBlockWidget(),
                    SizedBox(height: 20),
                    _BlockTwoWidget(),
                    SizedBox(height: 20),
                    _ThedBlock()
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _ThedBlock extends StatelessWidget {
  const _ThedBlock();

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Действие внутренних механизмов кубика Рубика базируется на вращении отдельных слоев вокруг центральных осей. Каждая из шести граней кубика может вращаться независимо от остальных:",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "1. Фронтальная (передняя) грань (F) - вращение по часовой стрелке или против.\n2. Задняя (задняя) грань (B) - вращение по часовой стрелке или против.\n3. Верхняя (верхняя) грань (U) - вращение по часовой стрелке или против.\n4. Нижняя (нижняя) грань (D) - вращение по часовой стрелке или против.\n5. Левая грань (L) - вращение по часовой стрелке или против.\n6. Правая грань (R) - вращение по часовой стрелке или против.",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        ButtonWidget(
            color: ColorsApp.blue,
            text: Text(
              "Читать подробнее",
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.toNamed("/junior_details_page");
            }),
      ],
    ));
  }
}

class _BlockTwoWidget extends StatelessWidget {
  const _BlockTwoWidget();

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Нумерация граней кубика Рубика не является официальной, но обычно используется следующая схема:",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "1. Белая грань расположена против красной. \n2. Синяя грань против оранжевой. \n3. Зеленая грань против желтой",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _OneBlockWidget extends StatelessWidget {
  const _OneBlockWidget();

  @override
  Widget build(BuildContext context) {
    return const ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DocTextWidget(
            font: FontWeight.bold,
            title: 'Кубик Рубика ',
            text:
                "- это популярная головоломка, состоящая из 26 маленьких кубиков, соединенных между собой. Каждая грань кубика состоит из 9 маленьких кубиков, образуя 3х3 матрицу. Внешне кубик Рубика выглядит как куб, разделенный на 6 граней разных цветов: белая, желтая, оранжевая, красная, синяя и зеленая.",
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(
                  AppImages.x3,
                ),
              ),
              Image(
                image: AssetImage(
                  AppImages.x3,
                ),
              ),
              Image(
                image: AssetImage(
                  AppImages.x4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
