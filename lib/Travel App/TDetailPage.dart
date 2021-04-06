import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_challenges/Travel%20App/PlanTripPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/ReadMorePage.dart';

class TDetailPage extends StatefulWidget {

  final String imageUrl;
  final String place;
  final String detail;
  final String rating;

  TDetailPage({this.imageUrl, this.detail, this.place, this.rating});

  @override
  _TDetailPageState createState() => _TDetailPageState();
}

class _TDetailPageState extends State<TDetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(widget.imageUrl, fit: BoxFit.cover, height: double.infinity, width: double.infinity,),

          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.place, style: TextStyle(color: Colors.white, height: 3, fontSize: 30),),
                Text(widget.detail, style: TextStyle(color: Colors.white70,),),
                SizedBox(height: height * 0.025,),
                Row(
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
                    Expanded(
                      child: RichText(text: TextSpan(children: <TextSpan>[
                        TextSpan(text: widget.rating,),
                        TextSpan(text: "(31 reviews)", style: TextStyle(color: Colors.white70))
                      ]),),
                    ),
                    Text("See reviews", style: TextStyle(color: Colors.white),),
                  ],
                ),

                SizedBox(height: height * 0.03,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadMorePage(
                              rating: widget.rating,
                              place: widget.place,
                              detail: widget.detail,
                              imageUrl: widget.imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Text("Read more", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.6)),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10))
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanTripPage(place: widget.place, imageUrl: widget.imageUrl,)));
                      },
                      child: Text("Plan trip", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10))
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          Positioned(
            top: 50,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_outlined, color: Colors.white,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
