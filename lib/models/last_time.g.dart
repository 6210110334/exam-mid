// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastTimeAdapter extends TypeAdapter<LastTime> {
  @override
  final int typeId = 0;

  @override
  LastTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastTime()
      ..title = fields[0] as String
      ..time = fields[1] as DateTime
      ..mode = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, LastTime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.mode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
