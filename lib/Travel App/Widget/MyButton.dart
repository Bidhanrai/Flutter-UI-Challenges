import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';

class MyButton extends StatelessWidget {

  final String buttonString;
  final Function action;
  MyButton({this.buttonString, this.action
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        action();
      },
      child: Text(buttonString, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.all(Constant.green),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14))
      ),
    );
  }
}

// Widget myButton(String buttonString, Function action) {
//   return TextButton(
//     onPressed: () {
//       action();
//     },
//     child: Text(buttonString, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
//     style: ButtonStyle(
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//         backgroundColor: MaterialStateProperty.all(Constant.green),
//         padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14))
//     ),
//   );
// }
