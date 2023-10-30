import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/login/login&Signup.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/task_tab.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});
  static const String RouteName="splash_screen";

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacementNamed(context, login_screen.RouteName);
    });
    return Scaffold(
      body:Image.asset(provider.theme == ThemeMode.light
            ? "assets/images/splash_light.png"
            : "assets/images/splash_dark.png",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
        ),
    );

  }
}
