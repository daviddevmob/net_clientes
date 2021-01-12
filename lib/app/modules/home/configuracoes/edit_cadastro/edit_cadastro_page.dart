import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flatbutton.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/loading_dialog.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'edit_cadastro_controller.dart';

class EditCadastroPage extends StatefulWidget {
  final ClienteModel clienteModel;
  const EditCadastroPage({Key key, @required this.clienteModel})
      : super(key: key);

  @override
  _EditCadastroPageState createState() => _EditCadastroPageState();
}

class _EditCadastroPageState
    extends ModularState<EditCadastroPage, EditCadastroController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      controller.bairro = widget.clienteModel.bairro;
      controller.clienteId = widget.clienteModel.clienteId;
      controller.whatsappController.text = widget.clienteModel.whatsapp;
      controller.cpfController.text = widget.clienteModel.cpf;
      controller.nomeController.text = widget.clienteModel.nome;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Editar Cadastro',
          viewLeading: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.1,
            right: size.width * 0.1,
            bottom: size.height * 0.05,
          ),
          child: Form(
            key: controller.formConfiguracoesKey,
            child: Column(
              children: <Widget>[
                TextWidget(
                  text:
                      'Atenção: suas informações preenchidas de forma correta possibilita tenhamos a melhor comunicação possível com você.',
                  fontSize: 16,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Observer(
                    builder: (_) => TextFieldWidget(
                      textEditingController: controller.nomeController,
                      hintText: 'Nome Completo',
                      labelText: 'Nome Completo',
                      enableField: !controller.saving,
                      validator: (name) {
                        if (name.toString().length < 6) {
                          return 'Insira seu nome completo';
                        } else if (name.toString() == null ||
                            name.toString() == '') {
                          return 'Campo Obrigatório';
                        }

                        return null;
                      },
                    ),
                  ),
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
                        if (telefone.toString() == null ||
                            telefone.toString() == '') {
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
                  height: size.height * 0.015,
                ),
                Observer(
                  builder: (_) => Container(
                    child: controller.saving == true
                        ? CupertinoActivityIndicator()
                        : ButtonWidget(
                            text: 'Salvar',
                            function: () async {
                              if (await ConnectionVerify.connectionStatus()) {
                                var save = await controller.saveDados();
                                if (save != controller.clienteId.toString()) {
                                  return AvisoFlushBar().showFlushBarAviso(
                                    context,
                                    'Erro ao atualiza dados',
                                    save,
                                  );
                                } else {
                                  return showCupertinoDialog(
                                      context: context,
                                      builder: (context) {
                                        return LoaderWidget(
                                          mensagem: 'Atualizando Dados...',
                                          segundos: 4,
                                        );
                                      });
                                }
                              } else {
                                InternetFlushBar()
                                    .showFlushBarInternet(context);
                              }
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
