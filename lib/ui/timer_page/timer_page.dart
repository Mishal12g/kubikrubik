import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/enums/timer_stopwatch.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/button_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';
import 'package:kubikrubik/ui/components/timer_button_widget.dart';
import 'package:kubikrubik/ui/timer_page/timer_page_controller.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedStyle = TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18,
    );
    const notSelectedStyle = TextStyle(
      color: ColorsApp.grey,
      fontSize: 16,
    );

    final TextEditingController selectTextFieldController =
        TextEditingController();
    final TextEditingController nameTextFieldController =
        TextEditingController();

    Get.lazyPut(() => TimerPageController());
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
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  GetBuilder<TimerPageController>(
                    builder: (controller) => Row(
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
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage(AppImages.record),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ContainerWidget(
                    widget: Column(
                      children: [
                        FormTextFieldWidget(
                          controller: nameTextFieldController,
                          text: "Название",
                          hintText: "Новая тренировка",
                        ),
                        const SizedBox(height: 12),
                        FormTextFieldWidget(
                          readOnly: true,
                          controller: selectTextFieldController,
                          text: "Выберите кубик",
                          hintText: "Кубик",
                          widget: _PopUpSize(selectTextFieldController),
                        ),
                        const SizedBox(height: 24),
                        const Divider(
                          color: ColorsApp.blueButton,
                        ),
                        const _MyTimerWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopUpSize extends StatelessWidget {
  final TextEditingController sizeController;
  const _PopUpSize(this.sizeController);

  @override
  Widget build(BuildContext context) {
    TimerPageController c = Get.find<TimerPageController>();

    return PopupMenuButton<String>(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      icon: const Image(
        image: AssetImage(AppImages.popUpClose),
      ),
      itemBuilder: (BuildContext context) {
        return c.catalogs.map((Catalog item) {
          return PopupMenuItem<String>(
            value: item.name,
            child: item == c.catalogs.first
                ? Row(
                    children: [
                      Text(item.name),
                      const Spacer(),
                      const Image(image: AssetImage(AppImages.popUpOpen))
                    ],
                  )
                : Text(item.name),
          );
        }).toList();
      },
      onSelected: (String selectedValue) {
        sizeController.text = selectedValue;
      },
    );
  }
}

class _MyTimerWidget extends StatelessWidget {
  const _MyTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TimerPageController c = Get.find<TimerPageController>();
    return GetBuilder<TimerPageController>(
      builder: (_) {
        switch (c.timerOrStopwatch) {
          case TimerStopwatch.timer:
            return Column(
              children: [
                TimerButtonWidget(
                  isPlay: c.isPlay,
                  action: () {
                    c.isPlay = !c.isPlay;
                    c.isPlay ? c.startTimer() : c.stopTimer();
                  },
                ),
                Center(
                  child: Text(
                    c.timeResult,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
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
                        onPressed: () => showCupertinoDialog<String>(
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
                                            .map((e) => Text(e))
                                            .toList(),
                                      ),
                                    ),
                                    ButtonWidget(
                                        color: ColorsApp.blue,
                                        text: const Text(
                                          "Выбрать",
                                          style: TextStyle(
                                            color: Colors.white,
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
                        ),
                        child: Row(
                          children: [
                            Text(
                              c.selectedTime,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
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
          case TimerStopwatch.stopwatch:
            return Column(
              children: [
                TimerButtonWidget(
                  isPlay: c.isPlay,
                  action: () {
                    c.isPlay = !c.isPlay;
                    c.isPlay ? c.startTimer() : c.stopTimer();
                  },
                ),
                Center(
                  child: Text(
                    c.timeResult,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
