// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatalogAdapter extends TypeAdapter<Catalog> {
  @override
  final int typeId = 1;

  @override
  Catalog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Catalog(
      id: fields[5] as String,
      name: fields[0] as String,
      size: fields[1] as String,
      comment: fields[2] as String?,
      image: fields[8] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Catalog obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
