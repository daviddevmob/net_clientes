import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:net_cliente/app/modules/login/criar_conta/dropdown_list.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flatbutton.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/loading_dialog.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'package:net_cliente/app/shared/utils/validators/validator_email.dart';
import 'criar_conta_controller.dart';

class CriarContaPage extends StatefulWidget {
  final String title;
  const CriarContaPage({Key key, this.title = "CriarConta"}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState
    extends ModularState<CriarContaPage, CriarContaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Criar Conta',
          viewLeading: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          child: Form(
            key: controller.formCreateUserKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'Fale um pouco sobre você',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: Cores.azul,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
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
                  height: size.height * 0.02,
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
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'Informações de Login',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: Cores.azul,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Align(
                  child: Container(
                    width: size.width * 0.8,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        textEditingController: controller.emailController,
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                        enableField: !controller.saving,
                        validator: (email) {
                          if (!emailValidator(email)) {
                            return 'E-mail inválido';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Align(
                  child: Container(
                    width: size.width * 0.8,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        textEditingController:
                            controller.confirmEmailController,
                        hintText: 'Confirmação de E-mail',
                        labelText: 'Confirmação de E-mail',
                        enableField: !controller.saving,
                        validator: (email) {
                          if (email.toString() !=
                              controller.emailController.text) {
                            return 'E-mails diferentes';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Align(
                  child: Container(
                    width: size.width * 0.8,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        textEditingController: controller.passwordController,
                        hintText: 'Senha',
                        labelText: 'Senha',
                        obscureText: controller.obscurePassword,
                        enableField: !controller.saving,
                        validator: (senha) {
                          if (senha.toString() == null ||
                              senha.toString() == '') {
                            return 'Campo Obrigatório';
                          } else if (senha.toString().length < 6) {
                            return 'A senha precisa ter no mínimo 6 dígitos';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Align(
                  child: Container(
                    width: size.width * 0.8,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        textEditingController:
                            controller.confirmPasswordController,
                        hintText: 'Confirmação de Senha',
                        labelText: 'Confirmação de Senha',
                        enableField: !controller.saving,
                        obscureText: controller.obscurePassword,
                        validator: (senha) {
                          if (senha.toString() !=
                              controller.passwordController.text) {
                            return 'Senhas Diferentes;';
                          }

                          return null;
                        },
                      ),
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
                              var save = await controller.saveUser();
                              if (save != controller.emailController.text) {
                                return AvisoFlushBar().showFlushBarAviso(
                                  context,
                                  'Erro ao criar conta',
                                  save,
                                );
                              } else {
                                return showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return LoaderWidget(
                                        mensagem: 'Criando usuário..',
                                        segundos: 4,
                                      );
                                    });
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
