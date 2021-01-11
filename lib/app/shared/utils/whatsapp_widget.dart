import 'package:flutter/material.dart';
import 'package:net_cliente/app/modules/totem/totem_controller.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class WhatsMobileWidget extends StatelessWidget {
  final TotemController controller;

  const WhatsMobileWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        controller.sendWhatsApp();
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: Color.fromRGBO(80, 177, 84, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: size.width * 0.06),
                child: TextWidget(
                  text: 'Fale Conosco',
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.06),
              height: size.height * 0.04,
              child: Image.asset(
                'assets/images/wpp-icon.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
