// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usr.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsrAdapter extends TypeAdapter<Usr> {
  @override
  final int typeId = 5;

  @override
  Usr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usr(
      id: fields[0] as String,
      usr: fields[1] as String,
      psw: fields[2] as String,
      name: fields[3] as String?,
      doc: fields[4] as String?,
      token: fields[5] as String?,
      usrType: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Usr obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.usr)
      ..writeByte(2)
      ..write(obj.psw)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.doc)
      ..writeByte(5)
      ..write(obj.token)
      ..writeByte(6)
      ..write(obj.usrType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
