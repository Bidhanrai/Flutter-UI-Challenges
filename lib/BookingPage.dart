import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with SingleTickerProviderStateMixin{

  double padValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        padValue = 10;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        alignment: Alignment.topCenter,
                        //colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.done_rounded,
                        color: Constant.yellow,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Text(
                "Booking\nis Successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Playfair Display",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Our manager will call\nYou back within 5 minutes to\nclarify some details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(child: SizedBox(),),
              TextButton(
                onPressed:() {
                  Navigator.pop(context);
                },
                child: AnimatedPadding(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.bounceOut,
                  padding: EdgeInsets.symmetric(vertical: padValue * 0.4, horizontal: padValue * 4),
                  child: Text(
                    "Go to Map",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0XFF30475e)),
                  //minimumSize: MaterialStateProperty.all(buttonSize),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  // padding: MaterialStateProperty.all<EdgeInsets>(
                  //   EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  // ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

