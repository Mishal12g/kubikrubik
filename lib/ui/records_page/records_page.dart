import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/records_page/records_page_controller.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Рекорды"),
      ),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<RecordPageController>(
                    builder: (RecordPageController controller) =>
                        ListView.builder(
                      itemCount:
                          Get.find<RecordPageController>().records.length,
                      itemBuilder: (context, index) {
                        final c = Get.find<RecordPageController>();
                        final reverse = c.records.reversed.toList();
                        final record = reverse[index];
                        if (index == 0) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              _RecordTileWidget(
                                record.date,
                                record.time,
                                record.size,
                              ),
                            ],
                          );
                        }
                        return _RecordTileWidget(
                          record.date,
                          record.time,
                          record.size,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecordTileWidget extends StatelessWidget {
  final String date;
  final String time;
  final String size;

  const _RecordTileWidget(this.date, this.time, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    size,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorsApp.grey,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        time,
                        style: const TextStyle(
                            fontSize: 14,
                            color: ColorsApp.blue,
                            fontWeight: FontWeight.w400),
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
