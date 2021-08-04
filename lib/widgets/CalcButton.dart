import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({ Key? key, required this.child, required this.Textcolor, required this.backgroundColor, required this.onPressed}) : super(key: key);
  final String child;
  final Color Textcolor;
  final Color backgroundColor;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 65,
        width: 65,
        child: TextButton(
          child: Text(child, style: TextStyle(fontSize: 28, color: Textcolor),),
          onPressed: (){onPressed(child);},
          style: TextButton.styleFrom(backgroundColor: backgroundColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        ),
      ),
    );
  }
}