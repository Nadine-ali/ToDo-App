import 'package:flutter/material.dart';
import 'package:todo_app/my_theme_data.dart';

class settings_tab extends StatelessWidget {
  const settings_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 70,left: 30),
            color: my_theme_data.primaryblue,
            width: MediaQuery.of(context).size.height,
            height: 177,
            child: Text("settings",style: TextStyle(
                color: my_theme_data.primarywhite,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
            ),
          );
  }
}
