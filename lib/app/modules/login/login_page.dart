import 'dart:io';

import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'package:net_cliente/app/shared/utils/validators/validator_email.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Login',
          viewLeading: false,
        ),
      ),
      body: Observer(
        builder: (_) => Container(
          child: controller.loading == true
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : Stack(
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
                    Platform.isAndroid
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Entrar com Google",
                              onPressed: () async {
                                try {
                                  String email = await controller.loginGoogle();
                                  if (email == 'erro') {
                                    print('erro');
                                  } else {
                                    Modular.to.pushReplacementNamed('/home',
                                        arguments: email);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SignInButton(
                              Buttons.AppleDark,
                              text: "Entrar com Apple",
                              onPressed: () async {
                                try {
                                  await controller.loginGoogle();
                                } catch (e) {
                                  print(e);
                                }
                              },
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
                                  textEditingController:
                                      controller.emailController,
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
                                  textEditingController:
                                      controller.passwordController,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Observer(
                                    builder: (_) => IconButton(
                                      icon: controller.viewPassWord == true
                                          ? Icon(CupertinoIcons.eye)
                                          : Icon(CupertinoIcons.eye_slash),
                                      onPressed: () {
                                        controller.viewPassWord =
                                            !controller.viewPassWord;
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
                                            if (await ConnectionVerify
                                                .connectionStatus()) {
                                              var login =
                                                  await controller.login();
                                              if (login !=
                                                  controller
                                                      .emailController.text) {
                                                return AvisoFlushBar()
                                                    .showFlushBarAviso(
                                                        context,
                                                        'Erro ao Entrar',
                                                        login);
                                              } else {
                                                Modular.to.pushReplacementNamed(
                                                    '/home',
                                                    arguments: login);
                                              }
                                            } else {
                                              InternetFlushBar()
                                                  .showFlushBarInternet(
                                                      context);
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
                              Align(
                                child: GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('/login/criar_conta');
                                  },
                                  child: Container(
                                    width: size.width * 0.8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextWidget(
                                          text: 'Crie sua conta',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: Colors.black,
                                          textDecoration:
                                              TextDecoration.underline,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}
