import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:net_cliente/app/modules/login/login_email_widget.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'package:rive/rive.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
 


  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      rootBundle.load('assets/flare/juice.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard..addController(SimpleAnimation('walk'));
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          controller.riveArtboard = artboard;
        }
      },
    );
    });
    super.initState();
  }

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
                  child: Stack(
                    children: [
                      Container(
                        child: Rive(
                            artboard: controller.riveArtboard,
                            fit: BoxFit.cover,
                            ),
                      ),
                      Positioned(
                        top: 600,
                        child: Container(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoActivityIndicator(),
                            ],
                          ),
                          ),
                        ),
                      Positioned(
                        top: 640,
                        child: Container(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: 'Preparando seu perfil',
                                fontSize: 14,
                                textColor: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        ),
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
                                              child: Observer(
                                                builder:(_) => SignInButton(
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
                                                    onPressed: () async {
                                                      return showDialog(
                                                        context: context,
                                                        builder: (context){
                                                          return CupertinoAlertDialog(
                                                            title: TextWidget(
                                                              text: 'Em Desenvolvimento',
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              textColor: Cores.verdeClaro, 
                                                            ),
                                                            content: TextWidget(
                                                              text: 'Estamos desenvolvendo a versão de iOS do No Eusébio Tem, em breve você conseguirá fazer login com sua conta Apple e também baixar nosso aplicativo no seu iPhone.',
                                                              fontSize: 15,
                                                            ),
                                                            actions: [
                                                              CupertinoDialogAction(
                                                                onPressed: (){
                                                                  Navigator.pop(context);
                                                                },
                                                                child: TextWidget(
                                                                  text: 'OK',
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,
                                                                  textColor: Cores.verdeClaro,
                                                                  ),
                                                                  )
                                                            ],
                                                          );
                                                        }
                                                        );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
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
                      SizedBox(
                        height: 80,
                      ),
                      GestureDetector(
                          onTap: () async{
                            if (await canLaunch('https://www.websitepolicies.com/policies/view/9ou3kXiE')) {
                              await launch('https://www.websitepolicies.com/policies/view/9ou3kXiE');
                            } else {
                              throw 'Could not launch';
                            }
                          },
                          child: Container(
                            width: size.width,
                            child: Column(
                              children: [
                                TextWidget(
                                      text: 'Ao entrar você concorda com',
                                      fontSize: 14,
                                    ),
                                TextWidget(
                                  text: 'Termo de Uso & Política de Privacidade',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                    ),
                              ],
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
      bottomNavigationBar: Observer(
        builder:(_) => Container(
          child: controller.loading == true 
        ? SizedBox()
        : TotemCeWidget(),
        ),
      ),
    );
  }
}
