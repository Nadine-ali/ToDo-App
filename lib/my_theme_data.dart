import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class my_theme_data{
  static const Color primaryblue=Color(0xff5D9CEC);
  static const Color primarylightgreen=Color(0xffDFECDB);
  static const Color primarydarkgrey=Color(0xff141922);
  static const Color primarydarkblue=Color(0xff060E1E);
  static const Color primarywhite=Color(0xffFFFFFF);
  // static const Color primaryblack=Color(0xff363636);
  static ThemeData lightTheme=ThemeData(
    colorScheme:ColorScheme.fromSeed(
      seedColor:primaryblue,
      primary: primaryblue,
      background: primarylightgreen,
      primaryContainer: primarywhite,
      secondary: primarydarkblue,

    ) ,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryblue,
      iconTheme: IconThemeData(
        color: primarywhite
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryblue,
      unselectedItemColor: Color(0xffC8C9CB)
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: primarywhite
    ),
    //
  );
  static ThemeData darkTheme=ThemeData(
    colorScheme:ColorScheme.fromSeed(
      seedColor:primaryblue,
      primary: primaryblue,
      background: primarydarkblue,
      primaryContainer: primarydarkgrey,
      secondary: primarywhite

    ) ,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryblue,
      iconTheme: IconThemeData(
        color: primarywhite
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryblue,
      unselectedItemColor: Color(0xffC8C9CB)
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: primarywhite
    ),
    //
  );
}
