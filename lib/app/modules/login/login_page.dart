import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flatbutton.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Login',
          viewLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/imagens-perfil/perfil.png'))),
              ),
              Observer(
                builder: (_) => Form(
                  key: controller.formLoginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.3,
                      ),
                      Align(
                        child: Container(
                          width: size.width * 0.8,
                          child: Observer(
                            builder: (_) => TextFieldWidget(
                              textEditingController: controller.emailController,
                              hintText: 'E-mail',
                              labelText: 'E-mail',
                              textInputType: TextInputType.emailAddress,
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
                        height: size.height * 0.025,
                      ),
                      Align(
                        child: Container(
                          width: size.width * 0.8,
                          child: Observer(
                            builder: (_) => TextFieldWidget(
                              textEditingController:
                                  controller.passwordController,
                              hintText: 'Senha',
                              labelText: 'Senha',
                              obscureText: controller.viewPassWord,
                              validator: (password) {
                                String erroPassword =
                                    controller.validatorPassword(password);
                                return erroPassword;
                              },
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => IconButton(
                          icon: controller.viewPassWord == false
                              ? Icon(CupertinoIcons.eye)
                              : Icon(CupertinoIcons.eye_slash),
                          onPressed: () {
                            controller.viewPassWord = !controller.viewPassWord;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Observer(
                        builder: (_) => Container(
                          child:  controller.loading == true
                          ? CupertinoActivityIndicator()
                          : ButtonWidget(
                            function: () async {
                              if (await ConnectionVerify.connectionStatus()) {
                                var login = await controller.login();
                                if (login != controller.emailController.text) {
                                  return AvisoFlushBar().showFlushBarAviso(
                                      context, 'Erro ao Entrar', login);
                                } else {
                                  Modular.to.pushReplacementNamed('/home',
                                      arguments: login);
                                }
                              } else {
                                InternetFlushBar().showFlushBarInternet(context);
                              }
                            },
                            text: 'Entrar',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Align(
                        child: GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed('/login/criar_conta');
                          },
                          child: Container(
                            width: size.width * 0.8,
                            child: TextWidget(
                              text: 'Ainda não tem uma conta? Crie agora!',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textColor: Cores.verde,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
