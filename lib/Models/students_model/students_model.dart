
import 'package:hive/hive.dart';
part 'students_model.g.dart';

@HiveType(typeId: 0)
class StudentsModel extends HiveObject{

  @HiveField(0)
  String studentName;

  @HiveField(1)
  String studentReg;

  @HiveField(2)
  String studentDepartment;

  StudentsModel({
    required this.studentName,
    required this.studentReg,
    required this.studentDepartment,
});


}