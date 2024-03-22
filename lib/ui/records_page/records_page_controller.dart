import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/record.dart';

class RecordPageController extends GetxController {
  List<RecordCatalog> records = [];

  addRecords(RecordCatalog record) {
    if (records.isNotEmpty) {
      if (record.seconds < records.last.seconds) {
        records.add(record);
        update();
      } else {
        int index = 0;
        while (
            index < records.length && records[index].seconds > record.seconds) {
          index++;
        }
        records.insert(index, record);
        update();
      }
    } else {
      records.add(record);
      update();
    }
  }
}
