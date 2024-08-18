// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:news_app/constants/appTheme.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/screens/news/ItemNewsDetails.dart';


// to refresh locale

// flutter gen-l10n

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: HomeScreen.route_Name,
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: const Locale("en"),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
  ],
      
      routes: {
        HomeScreen.route_Name: (context) => HomeScreen(),
        ItemNewsDetails.route_Name : (context)=> ItemNewsDetails(),
      },
    );
  }
}
