import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubikrubik/helpers/date_formatters.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/enums/timer_stopwatch.dart';
import 'package:kubikrubik/models/record_catalog.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';
import 'package:kubikrubik/ui/components/timer_button_widget.dart';
import 'package:kubikrubik/ui/records_page/records_page_controller.dart';
import 'package:kubikrubik/ui/timer_page/timer_page_controller.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void dispose() {
    super.dispose();
    final c = Get.find<TimerPageController>();
    c.clearResult();
    c.stopTimer();
    c.setTimerOrStopwatch(TimerStopwatch.timer);
  }

  @override
  Widget build(BuildContext context) {
    final selectedStyle = GoogleFonts.rubik(
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );

    final notSelectedStyle = GoogleFonts.rubik(
      color: ColorsApp.grey,
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
    );

    final TextEditingController selectTextFieldController =
        TextEditingController();
    final TextEditingController nameTextFieldController =
        TextEditingController();

    Get.lazyPut(() => TimerPageController());
    Get.put(RecordPageController());

    final c = Get.find<TimerPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Таймер"),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<TimerPageController>(
                builder: (controller) => ListView(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        const Spacer(),
                        TextButton(
                          child: Text(
                            "Таймер",
                            style: c.timerOrStopwatch == TimerStopwatch.timer
                                ? selectedStyle
                                : notSelectedStyle,
                          ),
                          onPressed: () {
                            c.setTimerOrStopwatch(TimerStopwatch.timer);

                            _clearTextFields(nameTextFieldController,
                                selectTextFieldController);
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Секундомер",
                            style:
                                c.timerOrStopwatch == TimerStopwatch.stopwatch
                                    ? selectedStyle
                                    : notSelectedStyle,
                          ),
                          onPressed: () {
                            c.setTimerOrStopwatch(TimerStopwatch.stopwatch);

                            _clearTextFields(nameTextFieldController,
                                selectTextFieldController);
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {
                              Get.toNamed("/records_page");
                            },
                            icon: const Image(
                              image: AssetImage(AppImages.record),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ContainerWidget(
                      widget: Column(
                        children: [
                          FormTextFieldWidget(
                            isEnabled: c.isPlay ? false : true,
                            controller: nameTextFieldController,
                            text: "Название",
                            hintText: "Новая тренировка",
                            onTap: () {},
                          ),
                          const SizedBox(height: 12),
                          _PopUpSize(selectTextFieldController),
                          const SizedBox(height: 24),
                          const Divider(
                            color: ColorsApp.blueButton,
                          ),
                          _MyTimerWidget(
                            nameTextFieldController: nameTextFieldController,
                            selectTextFieldController:
                                selectTextFieldController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clearTextFields(
    TextEditingController nameTextFieldController,
    TextEditingController selectTextFieldController,
  ) {
    if (!Get.find<TimerPageController>().isPlay) {
      nameTextFieldController.clear();
      selectTextFieldController.clear();
    }
  }
}

class _PopUpSize extends StatelessWidget {
  final TextEditingController sizeController;
  const _PopUpSize(this.sizeController);

  @override
  Widget build(BuildContext context) {
    TimerPageController c = Get.find<TimerPageController>();

    return FormTextFieldWidget(
      controller: sizeController,
      readOnly: true,
      hintText: 'Кубик',
      text: 'Выберите кубик',
      widget: const Image(
        width: 24,
        height: 24,
        image: AssetImage(AppImages.popUpClose),
      ),
      onTap: () {
        final RenderBox textFieldRenderBox =
            context.findRenderObject() as RenderBox;
        final textFieldPosition = textFieldRenderBox.localToGlobal(Offset.zero);
        if (c.catalogs.isNotEmpty) {
          showMenu(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            context: context,
            position: RelativeRect.fromLTRB(
              textFieldPosition.dx + textFieldRenderBox.size.width,
              textFieldPosition.dy + textFieldRenderBox.size.height,
              35,
              textFieldPosition.dy + textFieldRenderBox.size.height * 2,
            ),
            items: c.catalogs.map(
              (Catalog item) {
                return PopupMenuItem<Catalog>(
                  value: item,
                  child: item == c.catalogs.first
                      ? Row(
                          children: [
                            Text(
                              item.name,
                              style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                              ),
                            ),
                            const Spacer(),
                            const Image(image: AssetImage(AppImages.popUpOpen))
                          ],
                        )
                      : Text(
                          item.name,
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        ),
                );
              },
            ).toList(),
          ).then(
            (value) {
              if (value != null) {
                sizeController.text = value.name;
                c.catalog = value;
              }
            },
          );
        }
      },
    );
  }
}

class _MyTimerWidget extends StatelessWidget {
  final TextEditingController selectTextFieldController;
  final TextEditingController nameTextFieldController;

  const _MyTimerWidget({
    required this.nameTextFieldController,
    required this.selectTextFieldController,
  });

  @override
  Widget build(BuildContext context) {
    TimerPageController c = Get.find<TimerPageController>();
    return GetBuilder<TimerPageController>(
      builder: (_) {
        switch (c.timerOrStopwatch) {
          case TimerStopwatch.timer:
            return _TimerWidget(
                c: c,
                selectTextFieldController: selectTextFieldController,
                nameTextFieldController: nameTextFieldController);
          case TimerStopwatch.stopwatch:
            return _StopWatchWidget(
                c: c,
                selectTextFieldController: selectTextFieldController,
                nameTextFieldController: nameTextFieldController);
        }
      },
    );
  }
}

class _StopWatchWidget extends StatelessWidget {
  const _StopWatchWidget({
    required this.c,
    required this.selectTextFieldController,
    required this.nameTextFieldController,
  });

  final TimerPageController c;
  final TextEditingController selectTextFieldController;
  final TextEditingController nameTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerButtonWidget(
          isPlay: c.isPlay,
          action: () {
            if (selectTextFieldController.text.isNotEmpty &&
                nameTextFieldController.text.isNotEmpty) {
              c.isPlay = !c.isPlay;
              if (c.isPlay) {
                c.startTimer();
              } else {
                c.stopTimer();
                final record = RecordCatalog(
                  date: DateTime.now().toString(),
                  size: c.catalog?.size ?? "not size",
                  name: nameTextFieldController.text,
                  seconds: c.seconds,
                );

                Get.find<RecordPageController>().addRecords(record);
              }
            }
          },
        ),
        Center(
          child: Text(
            c.timeResult,
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 36.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimerWidget extends StatelessWidget {
  const _TimerWidget({
    required this.c,
    required this.selectTextFieldController,
    required this.nameTextFieldController,
  });

  final TimerPageController c;
  final TextEditingController selectTextFieldController;
  final TextEditingController nameTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerButtonWidget(
          isPlay: c.isPlay,
          action: () {
            if (selectTextFieldController.text.isNotEmpty &&
                nameTextFieldController.text.isNotEmpty) {
              c.isPlay = !c.isPlay;
              if (c.isPlay) {
                c.startTimer();
              } else {
                c.stopTimer();

                final record = RecordCatalog(
                  date: Formattes.dateAndTime(),
                  size: c.catalog?.size ?? "not size",
                  name: nameTextFieldController.text,
                  seconds: c.seconds,
                );

                Get.find<RecordPageController>().addRecords(record);
              }
            }
          },
        ),
        Center(
          child: Text(
            c.timeResult,
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 36.0,
            ),
          ),
        ),
        SizedBox(
          width: 130,
          child: Column(
            children: [
              const Divider(
                color: ColorsApp.blueButton,
              ),
              TextButton(
                onPressed: () {
                  if (!c.isPlay) {
                    showCupertinoDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                          ),
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white,
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CupertinoPicker(
                                    backgroundColor: Colors.white,
                                    itemExtent: 32.0,
                                    onSelectedItemChanged: (value) {
                                      c.selectTime(value);
                                    },
                                    children: c.timeStrings
                                        .map(
                                          (e) => Text(
                                            e,
                                            style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                ButtonWidget(
                                    color: ColorsApp.blue,
                                    text: Text(
                                      "Выбрать",
                                      style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.back();
                                    })
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Row(
                  children: [
                    Text(
                      c.selectedTime,
                      style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Image(
                      width: 25,
                      height: 25,
                      fit: BoxFit.contain,
                      image: AssetImage(AppImages.hourglass),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
