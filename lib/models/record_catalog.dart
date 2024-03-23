import 'package:hive/hive.dart';
part 'record_catalog.g.dart';

@HiveType(typeId: 2)
class RecordCatalog {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final String size;

  @HiveField(3)
  final int seconds;

  RecordCatalog({
    required this.seconds,
    required this.name,
    required this.date,
    required this.size,
  });
}
