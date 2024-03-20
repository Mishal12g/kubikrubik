import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/algorithms_page/algorithms_page_controller.dart';
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
                    onTap: () {
                      Get.toNamed("/algorithms_detail_page", arguments: 0);
                    },
                  ),
                  const SizedBox(height: 20),
                  AlgorithmsTileWidget(
                    text: 'Метод CFOP (Cross, F2L, OLL, PLL):',
                    onTap: () {
                      Get.toNamed("/algorithms_detail_page", arguments: 1);
                    },
                  ),
                  const SizedBox(height: 20),
                  AlgorithmsTileWidget(
                    text: 'Метод Roux',
                    onTap: () {
                      Get.toNamed("/algorithms_detail_page", arguments: 2);
                    },
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

class _PagesWidget extends StatefulWidget {
  const _PagesWidget();

  @override
  State<_PagesWidget> createState() => _PagesWidgetState();
}

class _PagesWidgetState extends State<_PagesWidget> {
  final controller = AlgorithmsPageController();
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemCount: controller.pages.length,
              itemBuilder: (context, index) {
                final page = controller.pages[index];

                return _PageWidget(
                    title: page.title,
                    text: page.text,
                    textTitle: page.titleText);
              },
            ),
          ),
          const SizedBox(height: 4),
          PageViewIndicator(
            otherSize: 8,
            currentSize: 8,
            otherColor: ColorsApp.indicator,
            length: controller.pages.length,
            currentIndex: _currentPageIndex,
          )
        ],
      ),
    );
  }
}

class _PageWidget extends StatelessWidget {
  final String title;
  final String textTitle;
  final String text;

  const _PageWidget({
    required this.title,
    required this.text,
    required this.textTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      edgeInsets: const EdgeInsets.all(0),
      widget: ListView(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          DocTextWidget(
            font: FontWeight.w600,
            title: textTitle,
            text: text,
          )
        ],
      ),
    );
  }
}
