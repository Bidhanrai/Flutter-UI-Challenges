import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class THomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            floating: true,
            title:  Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wb_sunny, size: 15, color: Colors.amber,),
                          SizedBox(width: 5),
                          Text("27, Oslo", style: TextStyle(fontSize: 14, color: Constant.grey),),
                        ],
                      ),
                      Text("Hello, Adam", style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),

                CircleAvatar(backgroundImage: AssetImage("assets/ecom/person1.jpg"),)
              ],
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current trip", style: TextStyle(fontWeight: FontWeight.w600),),
                    SizedBox(height: height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            "assets/travel/chill.jpg",
                            height: height * 0.25,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Oslo. norway",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "3 more days",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])),
          ),

          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(delegate: SliverChildListDelegate([
              Text("Trip plan", style: TextStyle(fontWeight: FontWeight.w600),)
            ])),
          ),
        ],
      ),
    );
  }
}
