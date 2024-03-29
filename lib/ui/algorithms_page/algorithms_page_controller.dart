import 'package:kubikrubik/models/page.dart';

class AlgorithmsPageController {
  final List<Page> pages = [
    Page(
        title: 'Основные шаги сборки кубика Рубика для новичков',
        titleText: "1. Сборка первого слоя (крест):",
        text:
            "\n• Начните собирать кубик с одного из краев (например, с белого центрального элемента). \n• Настройте краевые элементы так, чтобы цвета на них совпадали с цветами центральных элементов боковых граней.\n• Таким образом, вы должны получить крест белого цвета на верхней стороне кубика."),
    Page(
      title: "Основные шаги сборки кубика Рубика для новичков",
      titleText: "2. Сборка углов первого слоя:",
      text:
          "\n• Разверните кубик так, чтобы крест был сверху и найдите угловой элемент с белым цветом.\n•Поставьте данный угол на своё место, правильно ориентируя его относительно центральных элементов.",
    ),
    Page(
      title: "Основные шаги сборки кубика Рубика для новичков",
      titleText: "3. Сборка второго слоя:",
      text:
          "\n• Найдите краевые элементы, которые должны сочетаться по цветам с центром второго слоя (не учитывая белую сторону).\n• Разместите краевые элементы на своих местах, совмещая цвета.",
    ),
    Page(
      title: "Основные шаги сборки кубика Рубика для новичков",
      titleText: "4. Сборка желтого креста на верхнем слое:",
      text:
          "\n• Соберите крест желтого цвета на верхнем слое, ориентируясь по центральному элементу данной грани.",
    ),
    Page(
      title: "Основные шаги сборки кубика Рубика для новичков",
      titleText: "5. Расстановка углов верхнего слоя:",
      text:
          "\n• Решите ориентацию углов верхнего слоя, чтобы цвета на каждом угле совпадали с соответствующими центрами боковых граней.",
    ),
    Page(
      title: "Основные шаги сборки кубика Рубика для новичков",
      titleText: "6. Расстановка краев верхнего слоя:",
      text:
          "\n• Решите перестановку краев верхнего слоя для завершения сборки кубика.",
    )
  ];
}
