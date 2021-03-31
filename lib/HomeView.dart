import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/BookMakeupArtist/HomePage.dart';
import 'package:flutter_ui_challenges/E-Commerce/EHomePage.dart';
import 'package:flutter_ui_challenges/E-Commerce/SignInPage.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Flutter UI Kit"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
              title: Text("Book Makeup Artist"),
            ),
            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));},
              title: Text("E-Commerce app"),
            ),
          ],
        ),
      ),
    );
  }
}
