import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class PerfilCardProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  final Color corText;

  const PerfilCardProfile({
    Key key, 
    this.icon, 
    this.title, 
    this.function,
    this.corText = Colors.black,
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Card(
        margin: EdgeInsets.all(4),
        elevation: 2,
        child: SizedBox(
          width: size.width * 0.3,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(
                  height: size.height * 0.015,
                ),
                TextWidget(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: corText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
