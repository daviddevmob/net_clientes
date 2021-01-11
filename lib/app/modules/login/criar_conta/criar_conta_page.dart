import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
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
      appBar:  PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Criar Conta',
          viewLeading: true,
          ),
        ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
