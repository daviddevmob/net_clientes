import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/app_controller.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, AppController> {
  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      var currentUser = await controller.getUser();
      if (currentUser == 'login') {
        Modular.to.pushReplacementNamed('/login');
      } else {
        Modular.to.pushReplacementNamed('/home', arguments: currentUser);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.27,
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/images/imagens-perfil/capa.png',
              ))),
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            child: Container(
              width: size.width,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo-totem.png'))),
            ),
          ),
          Positioned(
            top: size.height * 0.95,
            left: size.width * 0.36,
            child: TextWidget(
              text: '@totem.ce',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
