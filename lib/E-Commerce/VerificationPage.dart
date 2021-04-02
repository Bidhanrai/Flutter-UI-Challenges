import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: height * 0.05),

              Text("Verification", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, height: 2),),
              Text("A 6 - digit pin has been sent to your email address, enter"
                  " it below to continue", style: TextStyle(height: 1.5, color: Colors.grey),),

              SizedBox(height: height * 0.1),

              Wrap(
                alignment: WrapAlignment.start,
                spacing: 4,
                direction: Axis.horizontal,
                runSpacing: 10,
                children: [
                  _otpTextField(context, true),
                  _otpTextField(context, false),
                  _otpTextField(context, false),
                  _otpTextField(context, false),
                  _otpTextField(context, false),
                  _otpTextField(context, false),
                ],
              ),

              SizedBox(height: height * 0.1),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text("CONTINUE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return  Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if(value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
