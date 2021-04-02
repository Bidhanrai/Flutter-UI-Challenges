import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/E-Commerce/SignInPage.dart';
import 'package:flutter_ui_challenges/E-Commerce/VerificationPage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),

                SizedBox(height: height * 0.05),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black45, height: 0.5),
                  ),
                ),

                SizedBox(height: height * 0.03),

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


                SizedBox(height: height * 0.1),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationPage()));
                    },
                    child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15)),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Already have an account? Sign In",
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
