import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/AppColor.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.transparentColor,
  appBarTheme: const AppBarTheme(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    )),
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 20, color: AppColor.whiteColor),
    backgroundColor: AppColor.primaryLightColor,
    titleSpacing: 35,
  ),
  textTheme: TextTheme(
    ///  appBar

    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.whiteColor,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.blackColor,
    ),

    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryLightColor,
    ),
      labelMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColor.whiteColor,
    ),

    // calender nameDays

    titleSmall: GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),

    // Digital Time

    bodySmall: GoogleFonts.roboto(
      fontSize: 10,
      color: AppColor.textColor,
    ),

    // hint TextStyle - selectTime

    bodyMedium: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),
    // title Lang - Mode
    headlineSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),
  ),
);
