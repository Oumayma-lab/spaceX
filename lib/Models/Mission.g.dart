// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mission.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionAdapter extends TypeAdapter<Mission> {
  @override
  final int typeId = 1;

  @override
  Mission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mission(
      missionId: fields[0] as String,
      missionName: fields[1] as String,
      description: fields[2] as String,
      manufacturers: (fields[3] as List).cast<String>(),
      payloadIds: (fields[4] as List).cast<String>(),
      wikipedia: fields[5] as String,
      website: fields[6] as String,
      twitter: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mission obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.missionId)
      ..writeByte(1)
      ..write(obj.missionName)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.manufacturers)
      ..writeByte(4)
      ..write(obj.payloadIds)
      ..writeByte(5)
      ..write(obj.wikipedia)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.twitter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
