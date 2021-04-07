import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TExploreView/TDetailPage.dart';

class TExploreView extends StatelessWidget {

  final List popularLocations = [
    {
      "place": "Bali, Indonesia",
      "price": "\$497",
      "image": "assets/travel/bali.jpg",
      "rating": "4.8",
      "detail" : "Bali is a beautiful  Indonesian island with a big  variety of "
          "landscape  blessings. It's a great  destination for your next trip.",
    },
    {
      "place": "Oahu, Hawaii",
      "price": "\$699",
      "image": "assets/travel/hawai.jpg",
      "rating": "4.9",
      "detail" : "Oahu is 44 miles (71 km) long and 30 miles (48 km) across. Its shoreline is 227 "
          "miles (365 km) long. The island is composed of two separate shield volcanoes: the Waiʻanae"
          " and Koʻolau Ranges, with a broad valley or saddle (the central Oahu Plain) between them.",
    },
    {
      "place": "Kathmandu, Nepal",
      "price": "\$290",
      "image": "assets/travel/nepal.webp",
      "rating": "5.0",
      "detail" : "Nepal has a diverse geography, including fertile plains, sub alpine "
          "forested hills, and eight of the world's ten tallest mountains, including Mount Everest, "
          "the highest point on Earth. Kathmandu is the capital and the largest city.",
    },
    {
      "place": "Bali, Indonesia",
      "price": "\$497",
      "image": "assets/travel/bali.jpg",
      "rating": "4.8",
      "detail" : "Bali is a beautiful  Indonesian island with a big  variety of "
          "landscape  blessings. It's a great  destination for your next trip.",
    },
  ];

  final List activity = [
    {
      "place": "Chillout",
      "image": "assets/travel/chill.jpg",
      "numberOfLocations": "32",
    },
    {
      "place": "Extreme",
      "image": "assets/travel/extreme.jpg",
      "numberOfLocations": "31",
    },
    {
      "place": "Culture",
      "image": "assets/travel/nepal.webp",
      "numberOfLocations": "18",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: height * 0.2,
            floating: true,
            elevation: 0,
            leading: InkWell(
              onTap: () {Navigator.pop(context);},
              focusColor: Colors.transparent,
              child: Icon(Icons.arrow_back_ios, color: Constant.green,),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: _appBar(height),
              titlePadding: EdgeInsets.only(right: 20, left: 40, top: 10),
            ),
          ),

          SliverList(delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _subHeading("Popular locations"),
                SizedBox(height: height * 0.02,),
                _popularPlaces(height)
              ],
            ),

            SizedBox(height: height * 0.05),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _subHeading("Browse by activity"),
                SizedBox(height: height * 0.02,),
                _browseByHistory(height)
              ],
            ),
          ]))
        ],
      ),
    );
  }

  Widget _appBar(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Find your next trip", style: TextStyle(fontSize: 14, color: Constant.grey),),
        Text("Explore Destinations", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, height: 1.5),),

        Expanded(child: SizedBox()),

        _searchBar(),
        Expanded(child: SizedBox()),

      ],
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.w500),
              prefixIcon: Icon(Icons.search, color: Colors.black26,),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            color: Constant.green,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.wrap_text_rounded, color: Colors.white,),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _subHeading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
    );
  }

  Widget _popularPlaces(double height) {
    return SizedBox(
      height: height * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularLocations.length,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TDetailPage(
                      imageUrl: popularLocations[index]["image"],
                      detail: popularLocations[index]["detail"],
                      place: popularLocations[index]["place"],
                      rating: popularLocations[index]["rating"],
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      popularLocations[index]["image"],
                      height: height * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            popularLocations[index]["place"],
                            style: TextStyle(color: Colors.white, backgroundColor: Colors.black38)
                        ),
                        Text(
                          "from ${popularLocations[index]["price"]}",
                          style: TextStyle(
                              color: Colors.white, fontSize: 12, backgroundColor: Colors.black38),)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          popularLocations[index]["rating"],
                          style: TextStyle(color: Colors.white, backgroundColor: Colors.black38),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow[700],
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _browseByHistory(double height) {
    return SizedBox(
      height: height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activity.length,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    activity[index]["image"],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.shortestSide * 0.35,
                    height: height * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          activity[index]["place"],
                          style: TextStyle(color: Colors.white, backgroundColor: Colors.black38)
                      ),
                      Text(
                        "${activity[index]["numberOfLocations"]} locations",
                        style: TextStyle(
                            color: Colors.white, fontSize: 12, backgroundColor: Colors.black38),)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
