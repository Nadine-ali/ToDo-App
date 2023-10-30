import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/provider/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.5,
        color: provider.theme == ThemeMode.light
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Light",
                    style:TextStyle(
                      color: my_theme_data.primaryblue,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  provider.theme == ThemeMode.light
                      ? Icon(Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,)
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                    style: TextStyle(
                        color: my_theme_data.primaryblue,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    )
                  ),
                  provider.theme == ThemeMode.dark
                      ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ));
  }
}