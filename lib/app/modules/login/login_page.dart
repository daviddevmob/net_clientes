import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:net_cliente/app/modules/login/login_email_widget.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
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
        child: Observer(
          builder:(_) => controller.loading == true
          ? SizedBox()
          : AppBarWidget(
            title: 'Login',
            viewLeading: false,
          ),
        ),
      ),
      body: Observer(
        builder: (_) => Container(
          child: controller.loading == true
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Carregando..',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CupertinoActivityIndicator(),
                    ],
                  ),
                )
              // ignore: missing_return
              : Observer(builder: (_) {
                  if (controller.metodo == 0) {

                    return Column(
                      children: [
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
                            elevation: 0,
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
                                  Platform.isAndroid
                                      ? Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: SignInButton(
                                                Buttons.GoogleDark,
                                                text: "Entrar com Google",
                                                onPressed: () async {
                                                  try {
                                                    String email =
                                                        await controller
                                                            .loginGoogle();
                                                    if (email == 'erro') {
                                                      print('erro');
                                                    } else {
                                                      Modular.to
                                                          .pushReplacementNamed(
                                                              '/home',
                                                              arguments: email);
                                                    }
                                                  } catch (e) {
                                                    print(e);
                                                  }
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextWidget(
                                              text: 'ou',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  child: SignInButton(
                                                    Buttons.AppleDark,
                                                    text: "Entrar com Apple",
                                                    onPressed: () async {},
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 50,
                                                  child: Observer(
                                                    builder:(_) => SignInButton(
                                                      Buttons.Email,
                                                      text: "Email e Senha",
                                                      onPressed: () async {
                                                        controller.metodoLogin =
                                                            1;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: SignInButton(
                                                Buttons.Apple,
                                                text: "Entrar com Apple",
                                                onPressed: () async {},
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextWidget(
                                              text: 'ou',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  child: SignInButton(
                                                    Buttons.Apple,
                                                    text: "Entrar com Google",
                                                    onPressed: () async {
                                                      try {
                                                        String email =
                                                            await controller
                                                                .loginGoogle();
                                                        if (email == 'erro') {
                                                          print('erro');
                                                        } else {
                                                          Modular.to
                                                              .pushReplacementNamed(
                                                                  '/home',
                                                                  arguments:
                                                                      email);
                                                        }
                                                      } catch (e) {
                                                        print(e);
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 50,
                                                  child: SignInButton(
                                                    Buttons.Email,
                                                    text: "Email e Senha",
                                                    onPressed: () async {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (controller.metodo == 1) {
                    return LoginEmailWidget(
                      controller: controller,
                    );
                  }
                }),
        ),
      ),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}
