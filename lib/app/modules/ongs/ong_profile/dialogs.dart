import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

void avisoVazioContatoDialog(BuildContext context, String contato) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: TextWidget(
                text: '$contato Indispoível',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              content: TextWidget(
                text: 'O dono da página preferiu não disponibilizar esse contato.',
                fontSize: 16,
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: TextWidget(
                    text: 'Ok',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
