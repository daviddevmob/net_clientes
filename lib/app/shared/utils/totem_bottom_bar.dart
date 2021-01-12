import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class TotemCeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          child: Image.asset(
            'assets/images/logo-totem-cinza.png',
            ),
        ),
        Container(
          child: TextWidget(
            text: '@totem.ce',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
