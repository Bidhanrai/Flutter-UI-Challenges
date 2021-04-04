import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/BookMakeupArtist/HomePage.dart';
import 'package:flutter_ui_challenges/E-Commerce/EHomePage.dart';
import 'package:flutter_ui_challenges/E-Commerce/SignInPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/OnBoardingPage.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  double size = 100;
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
              trailing: IconButton(
                onPressed: () {
                  //https://www.pinterest.com/pin/848928598510166336/
                },
                icon: Icon(Icons.link),
                tooltip: "Design By",
              ),
            ),
            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));},
              title: Text("E-Commerce app"),
              trailing: IconButton(
                onPressed: () {
                  //https://www.pinterest.com/pin/848928598510304234/
                },
                icon: Icon(Icons.link),
                tooltip: "Design By",
              ),
            ),

            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>OnBoardingPage()));},
              title: Text("Travel App"),
              trailing: IconButton(
                onPressed: () {
                  //https://dribbble.com/shots/14532750-Travel-App-UI-Full-Project
                },
                icon: Icon(Icons.link),
                tooltip: "Design By",
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          // hoverColor: Colors.transparent,
          // focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              if(size ==100){
                size = 200;
              } else {
                size = 100;
              }

            });
          },
          child: FlutterLogo(
            size: size,
            duration: Duration(milliseconds: 500),
            textColor: Colors.red,
            //style: FlutterLogoStyle.horizontal,
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );
  }
}
