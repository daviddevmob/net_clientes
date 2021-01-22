import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/home/configuracoes/enderecos/enderecos_controller.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class DialogsEndereco{
  void deleteCategoria(
      BuildContext context, EnderecosController controller, int enderecoId) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: TextWidget(
                text: 'Endeço',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              content: TextWidget(
                text: 'Deletar Endereço',
                fontSize: 16,
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: TextWidget(
                    text: 'Cancelar',
                    textColor: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: TextWidget(
                    text: 'Apagar',
                    textColor: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () async {
                    if (await ConnectionVerify.connectionStatus()) {
                    await controller.deleteLocalizacao(enderecoId);
                    Navigator.pop(context);
                    } else {
                      Modular.to.pop();
                      InternetFlushBar().showFlushBarInternet(context);
                              }
                            },
                          ),
                        ],
                      ));
                      }
}
