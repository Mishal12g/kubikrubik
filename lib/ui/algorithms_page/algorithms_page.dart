import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/algorithms_tile_widget.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/doc_text_widget.dart';

class AlgorithmsPage extends StatelessWidget {
  const AlgorithmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Алгоритмы"),
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
                  const SizedBox(height: 20),
                  const Image(
                    fit: BoxFit.contain,
                    image: AssetImage(AppImages.unsplash),
                  ),
                  const SizedBox(height: 20),
                  const _PagesWidget(),
                  const SizedBox(height: 12),
                  const _LabelMethodsAndAlgorithmsWidget(),
                  const SizedBox(height: 12),
                  const ContainerWidget(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Главный алгоритм — Пиф-паф",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text("Алгоритм состоит из 4 движений:"),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(AppImages.algorithms)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  AlgorithmsTileWidget(
                    text: 'Метод слоями (Beginner\'s Method)',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  AlgorithmsTileWidget(
                    text: 'Метод CFOP (Cross, F2L, OLL, PLL):',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  AlgorithmsTileWidget(
                    text: 'Метод Roux',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelMethodsAndAlgorithmsWidget extends StatelessWidget {
  const _LabelMethodsAndAlgorithmsWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Методы и алгоритмы решения головоломки:",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
    );
  }
}

class _PagesWidget extends StatelessWidget {
  const _PagesWidget();

  @override
  Widget build(BuildContext context) {
    return const ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Основные шаги сборки кубика Рубика для новичков",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 12),
          DocTextWidget(
              font: FontWeight.w600,
              title: "1. Сборка первого слоя (крест):",
              text:
                  "\n• Начните собирать кубик с одного из краев (например, с белого центрального элемента). \n• Настройте краевые элементы так, чтобы цвета на них совпадали с цветами центральных элементов боковых граней.\n• Таким образом, вы должны получить крест белого цвета на верхней стороне кубика."),
        ],
      ),
    );
  }
}
