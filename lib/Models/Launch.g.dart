// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Launch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchAdapter extends TypeAdapter<Launch> {
  @override
  final int typeId = 0;

  @override
  Launch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Launch(
      flightNumber: fields[0] as int,
      missionName: fields[1] as String,
      missionId: (fields[2] as List).cast<String>(),
      launchYear: fields[3] as String,
      launchDateLocal: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Launch obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.flightNumber)
      ..writeByte(1)
      ..write(obj.missionName)
      ..writeByte(2)
      ..write(obj.missionId)
      ..writeByte(3)
      ..write(obj.launchYear)
      ..writeByte(4)
      ..write(obj.launchDateLocal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
