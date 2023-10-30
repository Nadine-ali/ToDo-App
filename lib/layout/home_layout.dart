import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/add_task_bottomsheet.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/settings_tab.dart';
import 'package:todo_app/screens/task_tab.dart';



class home_layout extends StatefulWidget {
  const home_layout({super.key});
  static const String RouteName="Home_layout";

  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int selectedindex =0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: tabs[selectedindex],
      bottomNavigationBar:
      BottomAppBar(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: CircularNotchedRectangle(),
        notchMargin: 9,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: selectedindex,
          onTap: (index){
            selectedindex=index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_list.png"),size: 45),label: ""
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_settings.png"),size: 45,),label: ""
            ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (context) =>
              Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: add_task_bottomsheet(),
            ),
              isScrollControlled: true
            );
          },
          child:Icon(Icons.add,size: 40,) ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
  List<Widget> tabs = [
    task_tab(),
    settings_tab(),
  ];
}
