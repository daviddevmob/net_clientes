import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:net_cliente/app/modules/home/home_controller.dart';
import 'package:net_cliente/app/modules/login/criar_conta/dropdown_list.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flatbutton.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';

class AttDadosClienteHome extends StatelessWidget {
  final HomeController controller;

  const AttDadosClienteHome({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: controller.formCreateUserKey,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: 'Quase lá!',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: Cores.verdeClaro,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: size.width * 0.8,
            child: TextWidget(
              text: 'Em qual bairro você mora?',
              fontSize: 18,
            ),
          ),
          Observer(
            builder: (_) => Container(
              width: size.width * 0.8,
              child: Row(
                children: [
                  DropdownButton<int>(
                    value: controller.district,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    hint: TextWidget(
                      text: 'Selecione um bairro',
                      fontSize: 16,
                    ),
                    items: listDistrict,
                    onChanged: controller.changeDistrict,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Container(
            width: size.width * 0.8,
            child: Observer(
              builder: (_) => TextFieldWidget(
                textEditingController: controller.cpfController,
                hintText: 'CPF',
                labelText: 'CPF',
                enableField: !controller.saving,
                inputFormatters: [
                  MaskedTextInputFormatterShifter(
                    maskONE: "XXX.XXX.XXX-XX",
                    maskTWO: "XXX.XXX.XXX-XX",
                  )
                ],
                validator: (cpf) {
                  if (cpf.toString() == null || cpf.toString() == '') {
                    return 'Campo Obrigatório';
                  } else if (cpf.toString().length < 14 ||
                      cpf.toString().length > 14) {
                    return 'CPF Inválido';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Observer(
            builder: (_) => Container(
              width: size.width * 0.8,
              child: TextFieldWidget(
                hintText: 'Telefone / WhatsApp',
                labelText: 'Telefone / WhatsApp',
                enableField: !controller.saving,
                textEditingController: controller.whatsappController,
                inputFormatters: [
                  MaskedTextInputFormatterShifter(
                    maskONE: "(XX)XXXXX-XXXX",
                    maskTWO: "(XX)XXXXX-XXXX",
                  )
                ],
                validator: (telefone) {
                  if (telefone.toString() == null || telefone.toString() == '') {
                    return 'Campo Obrigatório';
                  } else if (telefone.toString().length < 14 ||
                      telefone.toString().length > 14) {
                    return 'Contato Inválido';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Observer(
            builder: (_) => Container(
              child: controller.saving == true
                  ? CupertinoActivityIndicator()
                  : ButtonWidget(
                      text: 'Salvar',
                      function: () async {
                        var save = await controller.saveUser();
                        if (save != 'ok') {
                          return AvisoFlushBar().showFlushBarAviso(
                            context,
                            'Erro ao atualizar dados',
                            save,
                          );
                        }
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
