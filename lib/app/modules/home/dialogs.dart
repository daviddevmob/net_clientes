import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/home/home_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
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

void infoGeralDialog(BuildContext context, String title, String mensage) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: TextWidget(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            content: TextWidget(
              text: mensage,
              fontSize: 16,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: TextWidget(
                  text: 'OK',
                  textColor: Cores.verdeClaro,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

void selecionarEndereco(BuildContext context, HomeController controller) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: TextWidget(
              text: "Selecione um Endereço",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textColor: Cores.verdeClaro,
            ),
            content: TextWidget(
              text: "Você precisa selecionar um endereço para sabermos exatamente os custos de envio.",
              fontSize: 16,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: TextWidget(
                  text: 'Voltar',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: TextWidget(
                  text: 'Selecionar',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Modular.to.pushNamed(
                          '/home/configuracoes/enderecos/',
                          arguments: controller.cliente.value,
                        );
                },
              ),
            ],
          ));
}
