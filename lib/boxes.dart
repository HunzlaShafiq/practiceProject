import 'package:hive/hive.dart';
import 'package:practice_project/Models/students_model/students_model.dart';

class Boxes{
  static Box getStudentData() => Hive.box<StudentsModel>('students');
}