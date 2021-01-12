import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ButtonConfigsWidget extends StatelessWidget {
  final Function function;
  final IconData icon;
  final String text;
  final Color colorTile;

  const ButtonConfigsWidget({
    Key key, 
    this.function, 
    this.icon, 
    this.text,
    this.colorTile = Cores.verde
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FlatButton(
      onPressed: function,
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.7,
        child: Card(
          elevation: 1,
          color: colorTile,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: size.width * 0.045),
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: size.width * 0.05),
              TextWidget(
                text: text,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
