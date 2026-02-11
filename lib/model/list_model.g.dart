// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListsModelAdapter extends TypeAdapter<ListsModel> {
  @override
  final int typeId = 2;

  @override
  ListsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListsModel(
      id: fields[0] as String,
      listName: fields[1] as String,
      typeIndex: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ListsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.typeIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
