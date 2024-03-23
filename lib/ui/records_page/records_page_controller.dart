import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/enums/records_state.dart';
import 'package:kubikrubik/models/record_catalog.dart';
import 'package:kubikrubik/services/records_service.dart';

class RecordPageController extends GetxController {
  final RecordService _recordService = RecordService();

  List<RecordCatalog> records = [];
  RecordsState _recordsState = RecordsState.myRecords;
  RecordsState get recordsState => _recordsState;

  RecordPageController() {
    loadRecords();
  }

  selectRecordState(RecordsState recordsState) {
    switch (_recordsState) {
      case RecordsState.myRecords:
        _recordsState = recordsState;
        update();
      case RecordsState.worldRecords:
        _recordsState = recordsState;
        update();
    }
  }

  addRecords(RecordCatalog record) {
    if (records.isNotEmpty) {
      if (record.seconds < records.last.seconds) {
        _recordService.add(record);
        loadRecords();
      } else {
        int index = 0;
        while (
            index < records.length && records[index].seconds > record.seconds) {
          index++;
        }
        _recordService.insert(index, record);
        loadRecords();
      }
    } else {
      _recordService.add(record);
      loadRecords();
    }
  }

  loadRecords() {
    _recordService.load();
    records = _recordService.records;
    update();
  }
}
