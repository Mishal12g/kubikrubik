// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_catalog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordCatalogAdapter extends TypeAdapter<RecordCatalog> {
  @override
  final int typeId = 2;

  @override
  RecordCatalog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordCatalog(
      seconds: fields[3] as int,
      name: fields[0] as String,
      date: fields[1] as String,
      size: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecordCatalog obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.seconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordCatalogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
