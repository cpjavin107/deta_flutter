import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deta/res/colors/appcolors.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore_for_file: prefer_const_constructors

class MyTheme {

  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          cardColor: Colors.white,
          canvasColor: creamColor,
          appBarTheme: AppBarTheme(
            color: Colors.black38,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            // iconTheme: Theme.of(context).textTheme,
          ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: AppColors.maroonColor),
  );


  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
          // brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          //     .copyWith(
          //     secondary: Colors.blueAccent, brightness: Brightness.dark),
          fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.black,
          canvasColor: darkCreamColor,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            // textTheme: Theme.of(context).textTheme.copyWith(
            //   headline6:
            //   context.textTheme.headline6?.copyWith(color: Colors.white),
            // ),
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;
  static Color blueish = Color(0xff403b58);
  static Color lightblueish = Vx.indigo500;
}