import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class RatingPage extends StatefulWidget {

  final String productName;
  RatingPage({@required this.productName});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Write Review"),
            toolbarHeight: MediaQuery.of(context).size.height * 0.15,
            elevation: 0,
            floating: true,
          ),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.03),
                  Text(widget.productName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: height * 0.05),

                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 55,
                    unratedColor: Colors.black12,
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),

                  SizedBox(height: height * 0.06),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Tell us your experience",
                      hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black26),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                    minLines: 1,
                    maxLines: 7,
                  ),
                  SizedBox(height: height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print("Send Clicked");
                          FocusScope.of(context).nextFocus();
                        },
                        child: Text("SEND", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
