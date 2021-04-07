import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TExploreView/TDetailPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TExploreView/TExploreView.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/THomeView.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TPlanView.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TSettingsView/TSettingsView.dart';

class THomePage extends StatefulWidget {
  @override
  _THomePageState createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: currentIndex == 0
          ? THomeView()
          : currentIndex == 1
            ? TPlanView()
            : currentIndex == 2
              ? TExploreView()
              : TSettingsView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Constant.green,
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        iconSize: 20,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded), label: "Plan"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

}
