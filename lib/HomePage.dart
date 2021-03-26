import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/DetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List data = [
    {
      "name": "Angela Hall",
      "rating": 4,
      "image": "assets/5.png",
      "color": Constant.yellow,
    },
    {
      "name": "Anya Vaughu",
      "rating": 4,
      "image": "assets/1.png",
      "color": Constant.pink,
    },
    {
      "name": "Carla Hart",
      "rating": 5,
      "image": "assets/3.png",
      "color": Constant.skyBlue,
    },
    {
      "name": "Lemi",
      "rating": 4,
      "image": "assets/4.png",
      "color": Constant.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              // title: Text("Get Ready"),
              // titleSpacing: 0,
              centerTitle: false,
              actions: [
                Icon(Icons.search, color: Colors.grey,)
              ],
            ),

            SliverList(delegate: SliverChildListDelegate(<Widget>[
              Text("Specialists", style: TextStyle(fontSize: 30, fontFamily: "Playfair Display", fontWeight: FontWeight.w500),),
              SizedBox(height: 24)
            ])),

            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  color: data[index]["color"],
                                  name: data[index]["name"],
                                  imageUrl: data[index]["image"],
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(25),
                        height: MediaQuery.of(context).size.height * 0.32,
                        decoration: BoxDecoration(
                          color: data[index]["color"],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Playfair Display",
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Makeup & Hairstyle",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Architects Daughter",
                                fontSize: 12
                              ),
                            ),
                            SizedBox(height: 20),
                            _rating(),
                            Expanded(child: SizedBox()),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      color: data[index]["color"],
                                      name: data[index]["name"],
                                      imageUrl: data[index]["image"],
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(horizontal: 15)),
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0XFF30475e)),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                              ),
                              child: Text(
                                "Show More",
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 10,
                        child: Hero(
                          tag: data[index]["image"],
                          child: Image.asset(
                            data[index]["image"],
                            height: MediaQuery.of(context).size.height * 0.3,
                            // scale: 2.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: data.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rating() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.white,),
        Icon(Icons.star, color: Colors.white,),
        Icon(Icons.star, color: Colors.white,),
        Icon(Icons.star, color: Colors.white,),
        Icon(Icons.star_border, color: Colors.white,)
      ],
    );
  }
}
