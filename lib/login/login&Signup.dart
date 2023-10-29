import 'package:flutter/material.dart';
import 'package:todo_app/login/loginView.dart';
import 'package:todo_app/login/signUpView.dart';
import 'package:todo_app/my_theme_data.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});
  static const String RouteName="login_screen";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: my_theme_data.primarylightgreen,
        appBar: AppBar(
          backgroundColor: my_theme_data.primaryblue,
          title: Text("ToDo List",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: my_theme_data.primarywhite,
          ),),
          bottom: TabBar(
            tabs: [
              Tab(child:Text("Log In",style: TextStyle(
                fontSize: 25
                ),
               ) ,
              ),
              Tab(child:Text("Sign Up",style: TextStyle(
                fontSize: 25
                  ),
                ) ,
              ),

            ],
          ),
        ),
        body: TabBarView(children:[
          logIn_view(),
          signUp_view(),
        ]),
      ),
    );
  }
}
