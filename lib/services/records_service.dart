import 'package:hive/hive.dart';
import 'package:kubikrubik/models/record_catalog.dart';

class RecordService {
  final _recordsList = "RecordsList";

  late Box<List> box;
  List<RecordCatalog> _records = [];
  List<RecordCatalog> get records => _records;

  load() {
    box = Hive.box<List>("Records");
    _records =
        box.get(_recordsList)?.map((e) => e as RecordCatalog).toList() ?? [];
  }

  add(RecordCatalog record) async {
    _records.add(record);
    await box.put(_recordsList, _records);
  }

  insert(int index, RecordCatalog record) async {
    _records.insert(index, record);
    await box.put(_recordsList, _records);
  }

  delete(int index) async {
    _records.removeAt(index);
    await box.put(_recordsList, _records);
  }
}
