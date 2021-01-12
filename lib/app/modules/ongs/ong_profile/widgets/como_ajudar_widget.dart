import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ComoAjudarWidget extends StatelessWidget {
  final String text;

  const ComoAjudarWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.heart_fill,
            color: Colors.red,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
              child: TextWidget(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
