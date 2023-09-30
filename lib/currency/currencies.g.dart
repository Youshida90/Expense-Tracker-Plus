// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Currency1Adapter extends TypeAdapter<Currency1> {
  @override
  final int typeId = 2;

  @override
  Currency1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency1(
      code: fields[0] as String,
      name: fields[1] as String,
      flag: fields[2] as String,
      symbol: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Currency1 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.flag)
      ..writeByte(3)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
