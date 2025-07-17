// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentsModelAdapter extends TypeAdapter<StudentsModel> {
  @override
  final int typeId = 0;

  @override
  StudentsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentsModel(
      studentName: fields[0] as String,
      studentReg: fields[1] as String,
      studentDepartment: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.studentName)
      ..writeByte(1)
      ..write(obj.studentReg)
      ..writeByte(2)
      ..write(obj.studentDepartment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
