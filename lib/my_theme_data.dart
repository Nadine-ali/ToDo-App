import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class my_theme_data{
  static const Color primaryblue=Color(0xff5D9CEC);
  static const Color primarylightgreen=Color(0xffDFECDB);
  static const Color primarywhite=Color(0xffFFFFFF);
  static const Color primaryblack=Color(0xff363636);
  static ThemeData lightTheme=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryblue,
      unselectedItemColor: Color(0xffC8C9CB)
    ),
    // textTheme: TextTheme(
    //     bodyLarge: GoogleFonts.poppins(
    //         color: primarywhite,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 30),
    //     bodyMedium: GoogleFonts.poppins(
    //         color: primaryblue, ),
    //     bodySmall: GoogleFonts.poppins(
    //         color: primaryblack, )
    // ),
  );
}
