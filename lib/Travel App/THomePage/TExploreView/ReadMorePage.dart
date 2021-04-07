import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/PlanTripPage/NewPlanPage.dart';

class ReadMorePage extends StatelessWidget {

  final String imageUrl;
  final String place;
  final String detail;
  final String rating;

  ReadMorePage({this.imageUrl, this.rating, this.detail, this.place});

  List data = [
    {
      "expense": "Flights",
      "price": "\$199",
      "icon": Icons.airplanemode_on_rounded,
      "color": Colors.blue[600]
    },
    {
      "expense": "Hotels",
      "price": "\$49 / night",
      "icon": Icons.local_hotel_rounded,
      "color": Colors.orange
    }
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: height * 0.4,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(place, style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
              ),

            ],
          ),

          Container(
            height: height * 0.6 + 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text("About Bali", style: TextStyle(fontWeight: FontWeight.w600),),

                SizedBox(height: height * 0.01),

                Text(detail, style: TextStyle(height: 1.6, color: Colors.grey[700]),),

                SizedBox(height: height * 0.03),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.only(right: 2.0),
                      itemSize: 20,
                      unratedColor: Colors.black12,
                      itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: RichText(text: TextSpan(children: <TextSpan>[
                        TextSpan(text: rating, style: TextStyle(color: Colors.black)),
                        TextSpan(text: "(31 reviews)", style: TextStyle(color: Colors.black38))
                      ]),),
                    ),
                    Text("See reviews", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),),
                  ],
                ),

                SizedBox(height: height * 0.04),

                Text("Pricing", style: TextStyle(fontWeight: FontWeight.w600),),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        data[index]["expense"],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      subtitle: Text(
                        "from ${data[index]["price"]}",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black26),
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: data[index]["color"].withOpacity(0.1)
                        ),
                        child: Icon(data[index]["icon"], color: data[index]["color"],),
                      ),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black26),
                      isThreeLine: true,
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPlanPage(
                      imageUrl: imageUrl,
                      place: place,
                    )));
                  },
                  child: Text("Plan trip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStateProperty.all(Constant.green),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14))
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 30,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
