import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';

class add_task_bottomsheet extends StatefulWidget {
  add_task_bottomsheet({super.key});

  @override
  State<add_task_bottomsheet> createState() => _add_task_bottomsheetState();
}

class _add_task_bottomsheetState extends State<add_task_bottomsheet> {
  var titleController= TextEditingController();

  var descriptionController= TextEditingController();
  var selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add task ",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color:Theme.of(context).colorScheme.secondary
            ),),
            SizedBox(height: 20,),
            TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary
              ),
              controller: titleController,
              decoration: InputDecoration(
                label: Text("Task Title",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20
                ),),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: my_theme_data.primaryblue
                    )
                )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              style: TextStyle(
                  color:Theme.of(context).colorScheme.secondary
              ),
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text("Task Description",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20
                  ),),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: my_theme_data.primaryblue
                    )
                )
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Select Date",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary
              ),),
            ),
            SizedBox(height: 8,),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Text(selectedDate.toString().substring(0,10),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                color: my_theme_data.primaryblue
              ),),
            ),
            SizedBox(height: 50,),

            ElevatedButton(
              onPressed: () {
              taskModel task=taskModel(
                  title: titleController.text,
                  description:descriptionController.text,
                  date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
                  userId: FirebaseAuth.instance.currentUser!.uid);

              firebaseManager.addTask(task);

              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("sucessfully"),
                  content: Text("task added successfully"),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Done"))
                  ],
                );
              },
              );

              // .then((value){
              // showDialog(context: context, builder: (context) {
              // return AlertDialog(
              // title: Text("sucessfully"),
              // content: Text("task added to firebase"),
              // actions: [
              // ElevatedButton(
              // onPressed: (){
              // Navigator.pop(context);
              // Navigator.pop(context);
              // },
              // child: Text("Done"))
              //      ]);
              //     },
              //   );
              // });
              // no need to use then as there is no future data to wait for
              // from database as storage became local when network was disabled in main

            } ,
              child: Text("Add Task",
                style: TextStyle(
                  fontSize: 25
                ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              fixedSize: Size(150, 50)
            ),
            )
          ],
        ),
      ),
    );
  }

  selectDate() async{
    DateTime? chosenDate= await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 100)),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if(chosenDate==null){
      return;
    }
    selectedDate=chosenDate;
    setState(() {

    });
  }
}
