import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/helpers/date_formatters.dart';
import 'package:kubikrubik/models/enums/records_state.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/records_page/records_page_controller.dart';

class RecordsPage extends StatelessWidget {
  final List titles = [
    "Скоростное сборка:",
    "Среднее время за пять сборок:",
    "Блиндсборка:",
    "Сборка с двумя руками:",
    "Однорукий подход:",
  ];
  final List texts = [
    "Феликс Земдегс из Австралии установил мировой рекорд в скоростной сборке кубика Рубика за 3.47 секунды. (2021 год)",
    "Юэн Ян из Китая установил мировой рекорд среднего времени за пять сборок кубика Рубика - 5.74 секунды. (2021 год)",
    "Макс Паркс из США установил рекорд в слепой сборке кубика Рубика за 23.7 секунды. (2021 год)",
    "Лукас Эттер из Швейцарии установил рекорд в сборке кубика Рубика с двумя руками за 4.90 секунды. (2015 год)",
    "Максим Виндиш из Германии установил рекорд в одноручной сборке кубика Рубика за 6.82 секунды. (2015 год)",
  ];

  RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStyle = GoogleFonts.rubik(
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );

    final notSelectedStyle = GoogleFonts.rubik(
      color: ColorsApp.grey,
      fontWeight: FontWeight.w300,
      fontSize: 16,
    );

    final c = Get.find<RecordPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Рекорды"),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          GetBuilder<RecordPageController>(
            builder: (controller) => Column(
              children: [
                _TwoButtonsSwitchWidget(
                  c: c,
                  selectedStyle: selectedStyle,
                  notSelectedStyle: notSelectedStyle,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: c.recordsState == RecordsState.myRecords
                        ? _MyRecordsListWidget(c: c)
                        : _WorldRecordsTileWidget(texts: texts, titles: titles),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorldRecordsTileWidget extends StatelessWidget {
  const _WorldRecordsTileWidget({
    required this.texts,
    required this.titles,
  });

  final List texts;
  final List titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: texts.length,
            itemBuilder: (context, index) {
              if (texts.length == 1) {
                return _RecordTile(
                  titles: titles,
                  texts: texts,
                  index: index,
                  borderRadius: BorderRadius.circular(2),
                  divider: Container(height: 1, color: ColorsApp.blueButton),
                );
              } else {
                if (index == 0) {
                  return _RecordTile(
                    titles: titles,
                    texts: texts,
                    index: index,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    divider: Container(height: 1, color: ColorsApp.blueButton),
                  );
                } else if (index == texts.length - 1) {
                  return _RecordTile(
                    titles: titles,
                    texts: texts,
                    index: index,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(2)),
                    divider: const SizedBox(),
                  );
                } else {
                  return _RecordTile(
                    titles: titles,
                    texts: texts,
                    index: index,
                    borderRadius: BorderRadius.circular(0),
                    divider: Container(height: 1, color: ColorsApp.blueButton),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

class _RecordTile extends StatelessWidget {
  final List titles;
  final List texts;
  final int index;
  final Widget divider;
  final BorderRadius borderRadius;

  const _RecordTile({
    required this.titles,
    required this.texts,
    required this.index,
    required this.borderRadius,
    required this.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titles[index],
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("•"),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  texts[index],
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          divider,
        ],
      ),
    );
  }
}

class _MyRecordsListWidget extends StatelessWidget {
  const _MyRecordsListWidget({
    required this.c,
  });

  final RecordPageController c;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: c.records.length,
      itemBuilder: (context, index) {
        final reverse = c.records.reversed.toList();
        final record = reverse[index];
        if (reverse.length == 1) {
          return Column(
            children: [
              const SizedBox(height: 20),
              _RecordTileWidget(
                  borderRadius: BorderRadius.circular(2),
                  date: record.date,
                  time: Formattes.formatDuration(record.seconds),
                  size: record.size),
            ],
          );
        } else {
          if (index == 0) {
            return Column(
              children: [
                const SizedBox(height: 20),
                _RecordTileWidget(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    date: record.date,
                    time: Formattes.formatDuration(record.seconds),
                    size: record.size),
              ],
            );
          } else if (index == reverse.length - 1) {
            return Column(
              children: [
                _RecordTileWidget(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                    date: record.date,
                    time: Formattes.formatDuration(record.seconds),
                    size: record.size),
              ],
            );
          } else {
            return Column(
              children: [
                _RecordTileWidget(
                    date: record.date,
                    time: Formattes.formatDuration(record.seconds),
                    size: record.size),
              ],
            );
          }
        }
      },
    );
  }
}

class _TwoButtonsSwitchWidget extends StatelessWidget {
  const _TwoButtonsSwitchWidget({
    required this.c,
    required this.selectedStyle,
    required this.notSelectedStyle,
  });

  final RecordPageController c;
  final TextStyle selectedStyle;
  final TextStyle notSelectedStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text(
            "Мои рекорды",
            style: c.recordsState == RecordsState.myRecords
                ? selectedStyle
                : notSelectedStyle,
          ),
          onPressed: () => c.selectRecordState(RecordsState.myRecords),
        ),
        TextButton(
          child: Text(
            "Мировые",
            style: c.recordsState == RecordsState.worldRecords
                ? selectedStyle
                : notSelectedStyle,
          ),
          onPressed: () => c.selectRecordState(RecordsState.worldRecords),
        ),
      ],
    );
  }
}

class _RecordTileWidget extends StatelessWidget {
  final String date;
  final String time;
  final String size;
  final BorderRadius? borderRadius;

  const _RecordTileWidget({
    required this.date,
    required this.time,
    required this.size,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    size,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Time",
                        style: GoogleFonts.rubik(
                          color: ColorsApp.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        time,
                        style: GoogleFonts.rubik(
                          color: ColorsApp.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: -7,
            right: 0,
            left: 0,
            child: Divider(
              color: ColorsApp.blueButton,
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }
}
