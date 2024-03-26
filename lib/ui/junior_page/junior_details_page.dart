import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/divice_cube_tile_widget.dart';
import 'package:kubikrubik/ui/components/doc_text_widget.dart';
import 'package:kubikrubik/ui/components/example_tile_widget.dart';

class JuniorDetailsPage extends StatelessWidget {
  const JuniorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Язык вращений кубика Рубика"),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 28),
                  const _DiviceCubeBlockWidget(),
                  const SizedBox(height: 20),
                  const _LanguageCubeBlockWidget(),
                  const SizedBox(height: 20),
                  ContainerWidget(
                      widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Примеры",
                        style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const ExampleTileWidget(
                        title: "F2",
                        text:
                            "Если после буквы стоит 2, нужно крутить эту сторону на 180 градусов.",
                        image: AppImages.example3,
                      ),
                      const SizedBox(height: 12),
                      const ExampleTileWidget(
                        title: "F’",
                        text:
                            "Если после буквы стоит штрих, нужно крутить сторону против часовой стрелки, как если бы мы смотрели на грань в лицо.",
                        image: AppImages.example2,
                      ),
                      const SizedBox(height: 12),
                      const ExampleTileWidget(
                        title: "F",
                        text:
                            "Просто буква означает, что нужно крутить сторонупо часовой стрелке, как если бы мы смотрели на грань в лицо.",
                        image: AppImages.example,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageCubeBlockWidget extends StatelessWidget {
  const _LanguageCubeBlockWidget();

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Язык вращений кубика Рубика",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Язык вращений кубика Рубика используется для описания действий при решении головоломки. Он представляет собой стандартные обозначения для вращения граней кубика. Вот основные символы и их значения:",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "1. R - правая грань (Right)",
              text: "- вращение правой грани по часовой стрелке."),
          const DocTextWidget(
              font: FontWeight.w600,
              title:
                  "2. R' - правая грань с обратным направлением (Right Prime)",
              text: "- вращение правой грани против часовой стрелки."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "3. L - левая грань (Left)",
              text: "- вращение левой грани по часовой стрелке."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "4. L' - левая грань с обратным направлением (Left Prime)",
              text: "- вращение левой грани против часовой стрелки."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "5. U - верхняя грань (Up)",
              text: "- вращение верхней грани по часовой стрелке."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "6. U' - верхняя грань с обратным направлением (Up Prime)",
              text: "- вращение верхней грани против часовой стрелки."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "7. D - нижняя грань (Down)",
              text: "- вращение нижней грани по часовой стрелке."),
          const DocTextWidget(
              font: FontWeight.w600,
              title:
                  "8. D' - нижняя грань с обратным направлением (Down Prime)",
              text: "- вращение нижней грани против часовой стрелки."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "9. F - передняя грань (Front)",
              text: "- вращение передней грани по часовой стрелке"),
          const DocTextWidget(
              font: FontWeight.w600,
              title:
                  "10. F' - передняя грань с обратным направлением (Front Prime) ",
              text: "- вращение передней грани против часовой стрелки."),
          const DocTextWidget(
              font: FontWeight.w600,
              title: "11. B - задняя грань (Back)",
              text: "- вращение задней грани по часовой стрелке."),
          const DocTextWidget(
              font: FontWeight.w600,
              title:
                  "12. B' - задняя грань с обратным направлением (Back Prime)",
              text: "- вращение задней грани против часовой стрелки."),
        ],
      ),
    );
  }
}

class _DiviceCubeBlockWidget extends StatelessWidget {
  const _DiviceCubeBlockWidget();

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Устройство кубика Рубика",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            "Знание устройства кубика — ваш серьезный инструмент при сборке, который позволяет выполнять правильные движения и не ошибаться на всех этапах сборки.",
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          const DiviceCubeTileWidget(
            image: AppImages.cube1,
            title: "Ребра",
            text:
                "Состоят из двух цветов, которые нельзя разъединить между собой",
          ),
          const SizedBox(height: 12),
          const DiviceCubeTileWidget(
            image: AppImages.cube3,
            title: "Углы",
            text:
                "Состоят из трех цветов, которые нельзя разъединить между собой",
          ),
          const SizedBox(height: 12),
          const DiviceCubeTileWidget(
            image: AppImages.cube2,
            title: "Центры",
            text:
                "Определяют цвет стороны, никогда не меняют своего положения относительно других центров",
          ),
        ],
      ),
    );
  }
}
