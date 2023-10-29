import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/login/login&Signup.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';
import 'package:todo_app/task_item.dart';

class task_tab extends StatefulWidget {
  task_tab({super.key});

  @override
  State<task_tab> createState() => _task_tabState();
}

class _task_tabState extends State<task_tab> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Stack(
            children:[
              Container(
                padding: EdgeInsets.only(top: 60,left: 30),
                color: my_theme_data.primaryblue,
                width: MediaQuery.of(context).size.height,
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TO DO List",
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: my_theme_data.primarywhite
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(onPressed:  () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, login_screen.RouteName);
                      }, icon: Icon(Icons.logout,size: 40,color: Colors.white,)),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:0,left: 30),
                margin: EdgeInsets.only(top: 100),
                alignment: AlignmentDirectional.bottomCenter,
                width: MediaQuery.of(context).size.height,
                height: 155,
                child: CalendarTimeline(
                  dayNameColor: my_theme_data.primaryblack,
                  showYears: true,
                  initialDate: selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 50)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateSelected: (date){
                    selectedDate=date;
                    setState(() {

                    });
                  },
                  leftMargin: 20,
                  monthColor: my_theme_data.primarywhite,
                  dayColor: Colors.black,
                  activeDayColor:my_theme_data.primaryblue,
                  activeBackgroundDayColor: my_theme_data.primarywhite,
                  dotsColor: my_theme_data.primaryblack,
                  selectableDayPredicate: (date) => date.day != 23,
                  locale: 'en_ISO',
                ),
              ),
            ]
        ),
        Expanded(child: StreamBuilder<QuerySnapshot<taskModel>> (
            stream:firebaseManager.getTasks(selectedDate),
            builder:(context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Text("something went wrong ");
              }

              List<taskModel>tasks=snapshot.data?.docs.map((doc) => doc.data()).toList()??[];

              return ListView.builder(
                itemBuilder:(context, index) {
                return taskItem(tasks[index]);
                  },
                itemCount: tasks.length,
                );
             },
          ),
        )
      ]);
  }
}
