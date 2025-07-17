import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_project/boxes.dart';
import 'package:practice_project/Models/students_model/students_model.dart';
import 'package:practice_project/Utils/Components/my_Text_field.dart';
import 'package:practice_project/services/firebase_notification_services.dart';

class NotesAppView extends StatefulWidget {
  const NotesAppView({super.key});

  @override
  State<NotesAppView> createState() => _NotesAppViewState();
}

var nameController = TextEditingController();
var regController = TextEditingController();
var departmentController = TextEditingController();





class _NotesAppViewState extends State<NotesAppView> {

  FirebaseNotificationServices notificationServices = FirebaseNotificationServices();

  @override
  void initState() {
    super.initState();

    notificationServices.getNotificationPermission();
    notificationServices.getFirebaseToken();
    notificationServices.initFirebaseNotification(context);
    notificationServices.setupInteractMessage(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S T U D E N T S"),
        centerTitle: true,
      ),

      body: ValueListenableBuilder(
          valueListenable: Boxes.getStudentData().listenable(),
          builder: (context,Box box,_){

            var studentDetails = box.values.toList().cast<StudentsModel>();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemCount: box.values.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                            motion:const StretchMotion(),
                            children: [
                              SlidableAction(

                                onPressed: (_){
                                  deleteStudentData(index);
                                },
                                backgroundColor: Color(0xFFB91C1C),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: (_){
                                  nameController.text =studentDetails[index].studentName ;
                                  regController.text =studentDetails[index].studentReg ;
                                  departmentController.text =studentDetails[index].studentDepartment ;
                                  showStudentDialog(true,index);
                                },
                                backgroundColor: Color(0xFF0392CF),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                            ]
                        ),
                        child: ListTile(
                          title: Text(studentDetails[index].studentName),
                          subtitle: Text(studentDetails[index].studentReg),
                          trailing: Text(studentDetails[index].studentDepartment),
                        ),
                      ),
                    );
                  }),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showStudentDialog(false,0);
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.notes_outlined, color: Colors.green,),

      ),
    );
  }

  showStudentDialog(bool isEdited,int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text('Student Data'),
            content: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: 15),
                    MyTextField(controller: nameController, hintText: 'Name'),
                    SizedBox(height: 15),
                    MyTextField(
                        controller: regController, hintText: 'Registration NO'),
                    SizedBox(height: 15),
                    MyTextField(controller: departmentController,
                        hintText: 'Department'),
                    SizedBox(height: 15),

                  ]
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {

                    if(nameController.text.isNotEmpty&&
                        regController.text.isNotEmpty&&
                        departmentController.text.isNotEmpty){

                      final studentData = StudentsModel(
                          studentName: nameController.text,
                          studentReg: regController.text,
                          studentDepartment: departmentController.text);

                      isEdited?  updateToHive(index,studentData):
                      addDateToHive(studentData);

                      clearData();

                      Navigator.pop(context);
                    }
                    else{

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Fill field Please'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }

                  },
                  child: Text(
                    isEdited ? 'U P D A T E':'A D D',
                    style: TextStyle(color: Colors.green),
                  )),
            ],
          );
        });
  }
}

updateToHive(int index,StudentsModel studentData) {
  Boxes.getStudentData().putAt(index, studentData);
}



void deleteStudentData(int index) {

  Boxes.getStudentData().deleteAt(index);

}

void clearData() {
  nameController.clear();
  regController.clear();
  departmentController.clear();
}

void addDateToHive(StudentsModel studentData) {

  var studentBox=Boxes.getStudentData();
  studentBox.add(studentData);


}
