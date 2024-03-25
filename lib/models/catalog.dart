import 'dart:typed_data';

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
  @HiveField(5)
  final String id;
  @HiveField(8)
  final Uint8List? image;

  Catalog({
    required this.id,
    required this.name,
    required this.size,
    required this.comment,
    required this.image,
  });
}
