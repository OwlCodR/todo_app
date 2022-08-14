// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskHiveAdapter extends TypeAdapter<TaskHive> {
  @override
  final int typeId = 0;

  @override
  TaskHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskHive(
      id: fields[0] as String,
      isDone: fields[1] as bool,
      title: fields[2] as String,
      importance: fields[9] as String,
      createdAt: fields[4] as int,
      changedAt: fields[5] as int,
      lastUpdatedBy: fields[6] as String,
      deadlineTime: fields[7] as int?,
      color: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.changedAt)
      ..writeByte(6)
      ..write(obj.lastUpdatedBy)
      ..writeByte(7)
      ..write(obj.deadlineTime)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.importance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
