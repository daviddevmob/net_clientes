import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ButtonWidget extends StatelessWidget {
  final Function function;
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;
  final double radiusButton;

  const ButtonWidget(
      {Key key,
      this.function,
      this.text = 'Texto',
      this.fontWeight = FontWeight.w500,
      this.textColor = Colors.white,
      this.buttonColor = Colors.blue,
      this.radiusButton = 8.0,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: buttonColor,
      onPressed: function,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusButton),
          side: BorderSide(color: Colors.transparent)),
      child: TextWidget(
        text: text,
        fontWeight: fontWeight,
        textColor: textColor,
      ),
    );
  }
}
