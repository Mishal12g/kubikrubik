import 'package:kubikrubik/models/detail_algorithms.dart';
import 'package:kubikrubik/resources/resources.dart';

class AlgorihmsDetailPageController {
  final List<DetailAlgorithms> details = [
    DetailAlgorithms(
        image: AppImages.video3,
        title: "Beginner's Method",
        text:
            "• Этот метод подразумевает пошаговое решение кубика Рубика по слоям, начиная с сборки креста и заканчивая финальной сборкой верхнего слоя."),
    DetailAlgorithms(
        image: AppImages.video1,
        title: "Cross, F2L, OLL, PLL",
        text:
            "• Один из наиболее распространенных продвинутых методов решения кубика, включающий четыре этапа: сборка креста, сборка первых двух слоев, ориентация последнего слоя (OLL) и перестановка последнего слоя (PLL)."),
    DetailAlgorithms(
        image: AppImages.video2,
        title: "Roux",
        text:
            "• Другой продвинутый метод, который сосредоточен на сборке блоков и последующем решении оставшихся элементов кубика."),
  ];
}
