import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/record.dart';

class RecordPageController extends GetxController {
  List<RecordCatalog> records = [];

  addRecords(RecordCatalog record) {
    records.add(record);
    update();
  }
}
