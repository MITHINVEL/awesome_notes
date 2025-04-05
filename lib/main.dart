import 'package:flutter/material.dart';
import 'package:awesome_notes/constant.dart';
import 'package:awesome_notes/mainpage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Awesome Notes',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'poppins',
        scaffoldBackgroundColor: background,
     appBarTheme: Theme.of( context).appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 30,
        fontFamily: 'fredoka',
        fontWeight: FontWeight.bold,
      )
     )
      ),
      home: const MyHomePage(),
    );
  }
}

