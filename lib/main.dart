import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/login/login&Signup.dart';
import 'package:todo_app/login/loginView.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/screens/task_tab.dart';
import 'package:todo_app/screens/settings_tab.dart';
import 'package:todo_app/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   FirebaseFirestore.instance.enableNetwork();
  // FirebaseFirestore.instance.disableNetwork();
  //so that data be stored only on phone and not one database (local storage)
  runApp(myApp());
  
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splash_screen.RouteName,
      // theme:my_theme_data.lightTheme,
      routes:{
        splash_screen.RouteName:(context)=>splash_screen(),
        home_layout.RouteName:(context)=>home_layout(),
        login_screen.RouteName:(context)=>login_screen(),
      }
    );
  }
}
