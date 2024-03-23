import 'package:hive/hive.dart';

part 'catalog.g.dart';

@HiveType(typeId: 1)
class Catalog {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String size;
  @HiveField(2)
  final String? comment;
  @HiveField(3)
  final String? photo;
  @HiveField(5)
  final String id;

  Catalog({
    required this.id,
    required this.name,
    required this.size,
    required this.comment,
    required this.photo,
  });
}
