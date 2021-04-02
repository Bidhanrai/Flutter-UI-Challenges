import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/E-Commerce/EHomePage.dart';
import 'package:flutter_ui_challenges/E-Commerce/SignUpPage.dart';

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
                Text("Sign in to Continue", style: TextStyle(fontSize: 14, color: Colors.black38, fontWeight: FontWeight.w600),),

                SizedBox(height: height * 0.05),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black45, height: 0.5),
                  ),
                ),

                SizedBox(height: height * 0.03),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black45, height: 0.5),
                  ),
                ),

                SizedBox(height: height * 0.03),

                Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.w600),textAlign: TextAlign.end,),

                SizedBox(height: height * 0.03),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EHomePage()));
                    },
                    child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15)),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                Text("- OR -", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87), textAlign: TextAlign.center,),

                SizedBox(height: height * 0.03),

                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.face),
                        SizedBox(width: 50,),
                        Expanded(
                          child: Text(
                            "Sign In with Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.face),
                        SizedBox(width: 50,),
                        Expanded(
                          child: Text(
                            "Sign In with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.04),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  child: Text(
                    "Don't have an account yet? Sign Up",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
