import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';

class taskItem extends StatelessWidget {
  taskModel task;
  taskItem(this.task,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 352,
          height: 115,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: my_theme_data.primarywhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Slidable(
            startActionPane:
            ActionPane(
              motion:DrawerMotion(),
              children: [
                SlidableAction(onPressed:(context) {
                firebaseManager.deletetask(task.id);
                },
                  backgroundColor: Colors.red,
                  label: "delete",
                  icon: Icons.delete,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),


                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 100,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: my_theme_data.primaryblue,
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 110,
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(task.title,style:
                        TextStyle(
                          color: my_theme_data.primaryblue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )
                        ),
                        Text(task.description, style:
                        TextStyle(
                            color: my_theme_data.primaryblack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        )),
                        Icon(Icons.access_time,size: 20,)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      firebaseManager.updatetask(task.id,true);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: task.isDone?Text("Done!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                          :Icon(Icons.done,
                        color: my_theme_data.primarywhite,
                        size: 20,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:task.isDone?Colors.green: my_theme_data.primaryblue,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
  }
}
