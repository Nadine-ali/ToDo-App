import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/login/loginView.dart';
import 'package:todo_app/login/signUpView.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/provider/my_provider.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});
  static const String RouteName="login_screen";

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:Theme.of(context).colorScheme.background,
        appBar: AppBar(

          elevation: 0,
          backgroundColor: my_theme_data.primaryblue,
          title: Text("ToDo List",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color:Theme.of(context).colorScheme.primaryContainer,
          ),),
          bottom: TabBar(
            tabs: [
              Tab(child:Text("Log In",style: TextStyle(
                fontSize: 25,
                color:Theme.of(context).colorScheme.primaryContainer,

                ),
               ) ,
              ),
              Tab(child:Text("Sign Up",style: TextStyle(
                fontSize: 25,
                color:Theme.of(context).colorScheme.primaryContainer,

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
