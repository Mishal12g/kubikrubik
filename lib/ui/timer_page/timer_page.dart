import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';
import 'package:kubikrubik/ui/components/form_text_field_widget.dart';
import 'package:kubikrubik/ui/components/timer_button_widget.dart';
import 'package:kubikrubik/ui/timer_page/timer_page_controller.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController selectTextFieldController =
        TextEditingController();
    final TextEditingController nameTextFieldController =
        TextEditingController();
    Get.lazyPut(() => TimerPageController());

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
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      const Spacer(),
                      TextButton(
                        child: const Text(
                          "Таймер",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text(
                          "Секундомер",
                          style: TextStyle(
                            color: ColorsApp.grey,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {},
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
                        const MyTimerWidget(),
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
      icon: const Image(
        image: AssetImage(AppImages.popUpClose),
      ),
      itemBuilder: (BuildContext context) {
        return c.catalogs.map((Catalog item) {
          return PopupMenuItem<String>(
            value: item.name,
            child: Text(item.name),
          );
        }).toList();
      },
      onSelected: (String selectedValue) {
        sizeController.text = selectedValue;
      },
    );
  }
}

class MyTimerWidget extends StatelessWidget {
  const MyTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TimerPageController c = Get.find<TimerPageController>();
    return GetBuilder<TimerPageController>(
      builder: (_) => Column(
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
      ),
    );
  }
}
