// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CurvedButton extends StatelessWidget {
  String text = '';
  Color buttonColor;
  Color borderColor;
  Color textColor;
  Function()? onPressed;
  double height;
  double fontSize;
  double width;

  CurvedButton(
      {super.key,
      this.borderColor = Colors.black87,
      this.textColor = Colors.black26,
      this.width = 60,
      this.height = 40,
      this.fontSize = 13.0,
      required this.text,
      this.buttonColor = Colors.white38,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Material(
        color: buttonColor,
        //Wrap with Material
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: borderColor),
            borderRadius: BorderRadius.circular(8.0)),
        elevation: 0,
        clipBehavior: Clip.antiAlias, // Add This
        child: MaterialButton(
          splashColor: Colors.green,
          elevation: 50,
          minWidth: width,
          height: height,
          color: buttonColor,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}