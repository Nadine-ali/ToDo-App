import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/themeBottomSheet.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/provider/my_provider.dart';

class settings_tab extends StatefulWidget {
  static const String RouteName = "settings_tab";

  const settings_tab({super.key});

  @override
  State<settings_tab> createState() => _settings_tabState();
}

class _settings_tabState extends State<settings_tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Column(
      children:
      [
        Container(
         padding: EdgeInsets.only(top: 70,left: 30),
         color: Theme.of(context).colorScheme.primary,
         width: MediaQuery.of(context).size.height,
         height: 177,
         child: Text("Settings",style: TextStyle(
         color: Theme.of(context).colorScheme.primaryContainer,
         fontSize: 30,
         fontWeight: FontWeight.bold
                ),
              ),
            ),
        Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.only(top: 30),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "theme",style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  showthemebottomsheet(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.sizeOf(context).width,
                  height: 55,
                  child: Text(provider.theme == ThemeMode.light
                      ? "Light"
                      : "Dark",style: TextStyle(
                      color:Theme.of(context).colorScheme.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),),
                ),
              ),
            ],
          ),
        ),
      ]

    );
  }

  void showthemebottomsheet(context) {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
