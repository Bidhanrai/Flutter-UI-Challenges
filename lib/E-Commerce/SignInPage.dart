import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/E-Commerce/EHomePage.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Welcome,", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
                SizedBox(height: height * 0.01),
                Text("Sign in to Continue", style: TextStyle(fontSize: 14, color: Constant.grey),),

                SizedBox(height: height * 0.05),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),

                SizedBox(height: height * 0.03),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),

                SizedBox(height: height * 0.03),

                Text("Forgot Password?", style: TextStyle(),textAlign: TextAlign.end,),

                SizedBox(height: height * 0.03),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EHomePage()));
                    },
                    child: Text("SIGN IN", style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.05),

                Text("- OR -"),

                SizedBox(height: height * 0.05),

                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.face),
                        SizedBox(width: 50,),
                        Expanded(child: Text("Sign In with Facebook", style: TextStyle(fontWeight: FontWeight.w500),)),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.face),
                        SizedBox(width: 50,),
                        Expanded(child: Text("Sign In with Google", style: TextStyle(fontWeight: FontWeight.w500),)),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
