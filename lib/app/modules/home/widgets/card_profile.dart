import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class CardsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;

  const CardsWidget({Key key, this.icon, this.title, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 5,
        child: SizedBox(
          width: size.width * 0.3,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextWidget(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
