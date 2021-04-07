import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/THomePage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/travel/travel.png",),

              SizedBox(height: height * 0.05,),

              Text(
                "Plan your trip easiest \nway possible.",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: height * 0.02,),

              Text(
                "Find interesting destinations and\ncreate plans for trips in seconds.",
                style: TextStyle(color: Constant.grey),
              ),

              SizedBox(height: height * 0.05,),

              Container(
                decoration: BoxDecoration(
                  color: Constant.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>THomePage()));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sports_handball_rounded, color: Colors.yellow[700],),
                      Text(
                        "198 new users today!",
                        style: TextStyle(fontSize: 12,),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
