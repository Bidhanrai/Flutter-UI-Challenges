import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text("Your discounts", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                Text("We prepared some amazing discounts for your  next trips"
                    ". We hope they will be useful.", style: TextStyle(),),

                SizedBox(height: height * 0.05),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.circle),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("15% hotel discount", style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Booking.com - valid until 24/07", style: TextStyle(color: Constant.grey),)
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.circle),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("15% hotel discount", style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Booking.com - valid until 24/07", style: TextStyle(color: Constant.grey),)
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.circle),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("15% hotel discount", style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Booking.com - valid until 24/07", style: TextStyle(color: Constant.grey),)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          Text("Create  more plans to get more discounts!")
        ],
      ),
    );
  }
}
