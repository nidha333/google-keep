// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class googleKeepAdapter extends TypeAdapter<googleKeep> {
  @override
  final int typeId = 0;

  @override
  googleKeep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return googleKeep(
      title: fields[0] as String?,
      note: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, googleKeep obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is googleKeepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
