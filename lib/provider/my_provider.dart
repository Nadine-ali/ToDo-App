import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myProvider extends ChangeNotifier{
  ThemeMode theme=ThemeMode.light;
  changetheme(ThemeMode newTheme ){
    theme=newTheme;
    notifyListeners();
  }
}