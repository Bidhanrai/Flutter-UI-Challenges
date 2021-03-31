import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/E-Commerce/RatingPage.dart';
import 'package:flutter_ui_challenges/E-Commerce/Widgets/ExpandableText.dart';


class ProductDetailPage extends StatefulWidget {

  final String productImageUrl;
  final String productName;
  ProductDetailPage({this.productImageUrl, this.productName});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  bool _isFavorite = false;

  List review  = [
    {
      "name": "Alina",
      "imageUrl": "assets/ecom/person2.jpg",
      "rating": 5,
      "review": "Wonderful T-shirt, perfect gift for my boy for our anniversary. "
          "I can honestly say, the best I have ever had. The material is substantial "
          "and they wash and iron well, time after time, always keeping their shape "
          "and never twisting. I wear them all year round, layering as necessary. "
          "I have recommended them many times, including on social media"
    },
    {
      "name": "James",
      "imageUrl": "assets/ecom/person1.jpg",
      "rating": 4,
      "review": "Nice and comfy T-shirt!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              floating: true,
              elevation: 0,
              actions: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: _isFavorite ? Colors.black : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.star_border_rounded, color: _isFavorite ? Colors.white : Colors.black,),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  //color: Colors.grey[200],
                  child: Image.asset(widget.productImageUrl, alignment: Alignment.center,fit: BoxFit.cover,),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(delegate: SliverChildListDelegate([
                Text(
                  widget.productName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, ),
                ),

                SizedBox(height: height * 0.03),

                Text("Details", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                SizedBox(height: height * 0.015),
                ExpandableText(
                  "Nike Dri-Fit is a polyester fabric designed to help you keep "
                  "dry so you can more comfortably work is a polyester fabric designed to help"
                  " you keep dry so you can more comfortably work is a polyester fabric designed to help you "
                  "keep dry so you can more comfortably work",
                  trimLines: 3,
                  textStyle: TextStyle(height: 2, fontSize: 14, color: Colors.black),
                ),

                SizedBox(height: height * 0.045),

                Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                SizedBox(height: height * 0.015),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingPage(productName: widget.productName,)));
                  },
                  splashColor: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text("Write your review", style: TextStyle(fontSize: 14),)),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.045),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 50),
                  itemCount: review.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(backgroundImage: AssetImage(review[index]["imageUrl"]),),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(review[index]["name"], style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),)),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rate_rounded, color: Colors.yellow[700],),
                                      Icon(Icons.star_rate_rounded, color: Colors.yellow[700],),
                                      Icon(Icons.star_rate_rounded, color: Colors.yellow[700],),
                                      Icon(Icons.star_rate_rounded, color: Colors.yellow[700],),
                                      Icon(Icons.star_rate_rounded, color: Colors.yellow[700],),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              ExpandableText(
                                review[index]["review"],
                                trimLines: 3,
                                textStyle: TextStyle(height: 1.5, color: Colors.black),
                              ),

                              SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ])),
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PRICE",
                    style: TextStyle(
                      color: Constant.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("\$1500",style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "ADD",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40,vertical: 14)),
                backgroundColor: MaterialStateProperty.all(Colors.black)
              ),
            )
          ],
        ),
      ),
    );
  }
}

