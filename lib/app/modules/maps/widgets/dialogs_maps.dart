import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/maps/maps_controller.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

void deleteLocalizacaoDialog(
    BuildContext context, MapsController controller, int localizacaoId) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: TextWidget(
              text: 'Deletar Localização',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            content: TextWidget(
              text: 'Tem certeza que quer deletar a localização do se negócio?',
              fontSize: 16,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: false,
                child: TextWidget(
                  text: 'Cancelar',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: TextWidget(
                  text: 'Deletar',
                  textColor: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () async {
                  if (await ConnectionVerify.connectionStatus()) {
                    Navigator.pop(context);
                    await controller.deleteLocalizacaoMaps(localizacaoId);
                    Modular.to.pop();
                  } else {
                    Navigator.pop(context);
                    InternetFlushBar().showFlushBarInternet(context);
                  }
                },
              ),
            ],
          ));
}
