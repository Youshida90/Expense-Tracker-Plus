// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenseitems.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.medical;
      case 1:
        return Category.communication;
      case 2:
        return Category.personal;
      case 3:
        return Category.work;
      case 4:
        return Category.utilities;
      case 5:
        return Category.groceries;
      case 6:
        return Category.others;
      default:
        return Category.medical;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.medical:
        writer.writeByte(0);
        break;
      case Category.communication:
        writer.writeByte(1);
        break;
      case Category.personal:
        writer.writeByte(2);
        break;
      case Category.work:
        writer.writeByte(3);
        break;
      case Category.utilities:
        writer.writeByte(4);
        break;
      case Category.groceries:
        writer.writeByte(5);
        break;
      case Category.others:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
