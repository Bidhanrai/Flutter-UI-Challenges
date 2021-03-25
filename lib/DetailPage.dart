import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class DetailPage extends StatefulWidget {

  final String name;
  final Color color;
  final String imageUrl;
  DetailPage({this.color, this.name, this.imageUrl});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                //color: widget.color,
              ),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 25,
                child: Hero(
                  tag: widget.imageUrl,
                  child: Image.asset(
                    widget.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.25,
                    // scale: 2.3,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 25,
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontFamily: "Playfair Display",
                    color: Colors.white,
                    fontSize: 35,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ],
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Constant.pink,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: Icon(Icons.house_rounded, color: Colors.white,),
                          onPressed: () {
                            print("dfsd");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFc19277),
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: Icon(Icons.house_rounded, color: Colors.white,),
                          onPressed: () {
                            print("hello2");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Constant.skyBlue,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: Icon(Icons.house_rounded, color: Colors.white,),
                          onPressed: () {
                            print("hello3");
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text("Makeup"),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text("Hairstyle"),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded),
                  ),

                  SizedBox(height: 20,),

                  Text("Date & Time", style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                  SizedBox(height: 10,),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey[400])
                          ]
                        ),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Select Date",
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey[400])
                            ]
                        ),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Select Time",
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    )
                  ],),

                  SizedBox(height: 40,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Information", style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                      Text("Read info", style: TextStyle(fontSize: 12, color: widget.color),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("I would like to introduce myself. my name is ${widget.name} and I am"
                      "a freelance makeup artist and hairdresser.",
                  style: TextStyle(fontSize: 12, wordSpacing: 1, height: 1.6),),

                  SizedBox(height: 40,),

                  TextButton(
                    onPressed: (){},
                    child: Text(
                      "Booking",
                      style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(widget.color.withOpacity(0.2)),
                    ),

                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
