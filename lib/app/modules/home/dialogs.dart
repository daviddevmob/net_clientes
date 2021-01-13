import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/modules/home/home_controller.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

avisoConstrucaoDialog(
    BuildContext context, String contato, HomeController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: TextWidget(
              text: '$contato',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            content: TextWidget(
              text:
                  'Estamos construindo este módulo, nos acompanhe no instagram @totem.ce para ficar por dentro das novidades.',
              fontSize: 16,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: TextWidget(
                  text: 'Seguir no Instagram',
                  textColor: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () async {
                  await controller.sendInstagram();
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: TextWidget(
                  text: 'Voltar para o NET',
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}
