import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/E-Commerce/ProductDetailPage.dart';

class EHomePage extends StatefulWidget {
  @override
  _EHomePageState createState() => _EHomePageState();
}

class _EHomePageState extends State<EHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            Text("Categories", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                padding: EdgeInsets.only(top: 5, left: 5),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _category("Men", "assets/ecom/men.png"),
                  _category("Women", "assets/ecom/women.png"),
                  _category("Devices", "assets/ecom/device.png"),
                  _category("Gadgets", "assets/ecom/gadget.png"),
                  _category("Gaming", "assets/ecom/gaming.png"),
                ],
              ),
            ),

            SizedBox(height: height * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Selling", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                Text("See all", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView(
                padding: EdgeInsets.only(top: 5, left: 5),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _bestSellingProduct("BeoPlay Speaker", "Bank and Olufsen", "\$755", "assets/ecom/speaker.jpg"),
                  _bestSellingProduct("Leather Wristwatch", "Tag Heuer", "\$2550", "assets/ecom/watch.jpg"),
                  _bestSellingProduct("Cosy winter Trousers", "Nike", "\$205", "assets/ecom/tshirt.jpg"),
                ],
              ),
            ),

            SizedBox(height: height * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured Brands", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                Text("See all", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView(
                padding: EdgeInsets.all(2),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _featuredBrand("B&o", "5693", "assets/ecom/b&o.png"),
                  _featuredBrand("Beats", "1124", "assets/ecom/beats.png"),
                ],
              ),
            ),

            SizedBox(height: height * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                Text("See all", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView(
                padding: EdgeInsets.only(top: 5, left: 5),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _bestSellingProduct("Tshirt", "Addidas", "\$155", "assets/ecom/tshirt.jpg"),
                  _bestSellingProduct("Leather Wristwatch", "Tag Heuer", "\$2550", "assets/ecom/watch.jpg"),
                  _bestSellingProduct("Cosy winter Trousers", "Nike", "\$205", "assets/ecom/speaker.jpg"),
                ],
              ),
            ),

            SizedBox(height: height * 0.1),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search_outlined, color: Colors.black,)),
          BottomNavigationBarItem(label: "sdf", icon: Icon(Icons.shopping_cart_outlined,)),
          BottomNavigationBarItem(label: "dafs", icon: Icon(Icons.person_outline_outlined,))
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 100,
      title: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black,),
              filled: true,
              fillColor: Colors.black.withOpacity(0.05),
              contentPadding: EdgeInsets.all(10)
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
            ),
            child: Icon(Icons.camera_alt_outlined, color: Colors.white,),
          ),
        )
      ],
    );
  }

  Widget _category(String categoryName, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(categoryName == "Women" ? 15 : 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey[100], spreadRadius: 1, blurRadius: 2),
                ],
                shape: BoxShape.circle,
              ),
              child: Image.asset(imageUrl, fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 6),
          Text(categoryName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),),
        ],
      ),
    );
  }

  Widget _bestSellingProduct(String productName, String productBrand, String price, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(productImageUrl: imageUrl, productName: productName,)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(imageUrl)
            ),
            Text(productName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,),),
            Text(productBrand, style: TextStyle(color: Constant.grey, fontSize: 12, height: 1.5),),
            Text(price, style: TextStyle(fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }

  Widget _featuredBrand(String brandName, String numberOfProducts, String logoUrl) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(right: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[100], spreadRadius: 1, blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _brandLogo(logoUrl),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(brandName, style: TextStyle(fontWeight: FontWeight.w600),),
              Text(numberOfProducts+" Products", style: TextStyle(fontSize: 12, color: Constant.grey,),)
            ],
          )
        ],
      ),
    );
  }

  Widget _brandLogo(String logoUrl) {
    return Image.asset(logoUrl);
  }

}
