import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/Widget/MyButton.dart';

class AddHotelAndFlightPage extends StatelessWidget {

  final Function action;
  AddHotelAndFlightPage({this.action});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _textWidget("Hotel"),
        SizedBox(height: height * 0.02),
        _imageWidget(height),

        SizedBox(height: height * 0.04),

        _textWidget("Flights"),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.flag, color: Colors.red,),
                  ),
                  Text("LAX", style: TextStyle(height: 2, fontSize: 25),),
                  Text("20.30, 6:00 AM", style: TextStyle(color: Constant.grey),),
                  SizedBox(height: height * 0.02),
                  Text("First Class", style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Icon(Icons.arrow_forward),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.outlined_flag, color: Colors.orange,),
                  ),
                  Text("DPS", style: TextStyle(height: 2, fontSize: 25),),
                  Text("20.30, 1:00 PM", style: TextStyle(color: Constant.grey),),
                  SizedBox(height: height * 0.02),
                  Text("First Class", style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: height * 0.04),

        _textWidget("Costs"),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hotel(4 nights)", style: TextStyle(),),
            Text("\$796", style: TextStyle(color: Constant.green),),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Flights", style: TextStyle(),),
            Text("\$861", style: TextStyle(color: Constant.green),),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: TextStyle(),),
            Text("\$1657", style: TextStyle(color: Constant.green),),
          ],
        ),

        SizedBox(height: height * 0.05),

        MyButton(action: action, buttonString: "Create trip plan",),
      ],
    );
  }

  Widget _textWidget(String title) {
    return Text(title, style: TextStyle(fontWeight: FontWeight.w600),);
  }

  Widget _imageWidget(double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Image.asset(
            "assets/travel/chill.jpg",
            height: height * 0.12,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            height: height * 0.12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white12, Colors.black38,Colors.white12],
              ),
            ),
          ),

          Positioned(
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Hanging Gardens of Bali Hotel",
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 4,
                  itemPadding: EdgeInsets.only(right: 2.0),
                  itemSize: 15,
                  unratedColor: Colors.black12,
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow[800],
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
