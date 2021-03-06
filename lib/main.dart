import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/BookMakeupArtist/HomePage.dart';
import 'package:flutter_ui_challenges/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Open Sans",
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.grey,
        )
      ),
      home: HomeView(),
    );
  }
}

