// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteProductHiveAdapter extends TypeAdapter<FavoriteProductHive> {
  @override
  final int typeId = 3;

  @override
  FavoriteProductHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProductHive(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as double?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteProductHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
