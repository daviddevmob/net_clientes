import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/login/login_controller.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'package:net_cliente/app/shared/utils/validators/validator_email.dart';

class LoginEmailWidget extends StatelessWidget {
  final LoginController controller;

  const LoginEmailWidget({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.5,
                child: Image.asset(
                  'assets/images/imagens-perfil/perfil.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 30,
            ),
            child: Form(
              key: controller.formLoginKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  Observer(
                    builder: (_) => TextFieldWidget(
                      enableField: !controller.loading,
                      textEditingController: controller.emailController,
                      hintText: 'Email',
                      validator: (email) {
                        if (!emailValidator(email)) {
                          return 'E-mail inválido';
                        }

                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) => TextFieldWidget(
                      enableField: !controller.loading,
                      textEditingController: controller.passwordController,
                      hintText: 'Senha',
                      validator: (senha) {
                        if (senha.isEmpty || senha.length < 6) {
                          return 'Senha inválida';
                        }

                        return null;
                      },
                      obscureText: !controller.viewPassWord,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(
                        builder: (_) => IconButton(
                          icon: controller.viewPassWord == true
                              ? Icon(CupertinoIcons.eye)
                              : Icon(CupertinoIcons.eye_slash),
                          onPressed: () {
                            controller.viewPassWord = !controller.viewPassWord;
                          },
                        ),
                      ),
                      Observer(
                        builder: (_) => FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: const TextWidget(
                            text: 'Esqueci minha senha',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 44,
                    child: Observer(
                      builder: (_) => RaisedButton(
                        onPressed: controller.loading == true
                            ? null
                            : () async {
                                if (await ConnectionVerify.connectionStatus()) {
                                  var login = await controller.login();
                                  if (login !=
                                      controller.emailController.text) {
                                    return AvisoFlushBar().showFlushBarAviso(
                                        context, 'Erro ao Entrar', login);
                                  } else {
                                    Modular.to.pushReplacementNamed('/home',
                                        arguments: login);
                                  }
                                } else {
                                  InternetFlushBar()
                                      .showFlushBarInternet(context);
                                }
                              },
                        color: Colors.blue,
                        disabledColor: Colors.white,
                        child: controller.loading == true
                            ? CupertinoActivityIndicator()
                            : TextWidget(
                                text: 'Entrar',
                                textColor: Colors.white,
                                fontSize: 18,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Observer(
                        builder:(_) => GestureDetector(
                          onTap: () {
                            controller.metodoLogin = 0;
                          },
                          child: TextWidget(
                            text: 'Voltar',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/login/criar_conta');
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: 'Crie sua conta',
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
