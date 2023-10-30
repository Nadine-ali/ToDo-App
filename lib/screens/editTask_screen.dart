import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';

class editTask extends StatefulWidget {

  static const String RouteName="editTask_screen";
  taskModel task;
  editTask({required this.task});

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  late var selectedDate;

  @override
  void initState(){
    super.initState();
    titleController.text=widget.task.title;
    descriptionController.text=widget.task.description;
    selectedDate=DateTime.fromMicrosecondsSinceEpoch(widget.task.date);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
      ),
      body:Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20,left: 30),
                color:Theme.of(context).colorScheme.primary,
                width: MediaQuery.of(context).size.height,
                height: 170,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TO DO List",
                        style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color:Theme.of(context).colorScheme.primaryContainer
                        )
                    ),

                  ],
                ),
              ),
              SizedBox(height: 80,),
              Container(
                margin: EdgeInsets.only(top: 100,),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(15)
                ),
                alignment: Alignment.topCenter,
                height: 550,
                width: 330,
                child: Column(
                  children: [
                    Text("Edit Task",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary
                    ),),
                    SizedBox(height: 45,),
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
                    SizedBox(height: 25,),
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
                    SizedBox(height: 25,),
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
                    ElevatedButton(onPressed: () {
                      taskModel task=taskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
                          userId:widget.task.userId,
                          id: widget.task.id,
                          isDone: widget.task.isDone
                      );
                      firebaseManager.editTask(task);
                      Navigator.pop(context);
                    } ,
                        child:Text("Edit Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                       ),
                    ),
                  ],
                ),
              )

            ],
          )
        ],
      ) ,
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
