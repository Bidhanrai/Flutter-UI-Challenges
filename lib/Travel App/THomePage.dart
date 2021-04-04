import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class THomePage extends StatefulWidget {
  @override
  _THomePageState createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Find your next trip", style: TextStyle(fontSize: 14, color: Constant.grey),),
            Text("Explore Destinations", style: TextStyle(fontWeight: FontWeight.w700),),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Constant.grey, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Constant.green,
                      shape: BoxShape.circle
                  ),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
