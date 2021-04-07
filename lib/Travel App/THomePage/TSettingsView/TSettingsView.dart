import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TSettingsView/DiscounstPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/THomePage/TSettingsView/EditProfilePage.dart';

class TSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Your preferences", style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Adam", style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("Photographer", style: TextStyle(color: Colors.grey[500]),),
            leading: CircleAvatar(backgroundImage: AssetImage("assets/ecom/person1.jpg"),minRadius: 23, maxRadius: 25,),
            trailing: TextButton(
              child: Text("Edit profile", style: TextStyle(color: Constant.green),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage()));
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(Constant.green.withOpacity(0.1)),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 15)),
              ),
            ),
          ),

          Divider(),

          ListTile(
            title: Text("Payment methods", style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("Manage your cards", style: TextStyle(color: Colors.grey[500]),),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
              ),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.grey[400],),
          ),

          Divider(),

          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DiscountPage()));
            },
            title: Text("Discounts", style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("Check out your discounts", style: TextStyle(color: Colors.grey[500]),),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
              ),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.grey[400],),
          ),

          Divider(),

          ListTile(
            title: Text("Notifications", style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("Notification preferences", style: TextStyle(color: Colors.grey[500]),),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
              ),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.grey[400],),
          ),

          Divider(),

          ListTile(
            title: Text("Time zone", style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("Change your time zone", style: TextStyle(color: Colors.grey[500]),),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
              ),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.grey[400],),
          ),

          SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.logout, color: Colors.red,),
                label: Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
