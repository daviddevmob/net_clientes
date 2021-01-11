import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final TextDecoration textDecoration;

  const TextWidget({
    Key key,
    this.text = 'Title',
    this.fontWeight = FontWeight.w300,
    this.fontSize = 20,
    this.textColor = Colors.black,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
        decoration: textDecoration
      ),
    );
  }
}
