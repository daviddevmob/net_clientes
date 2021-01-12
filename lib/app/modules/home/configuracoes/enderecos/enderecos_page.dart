import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'enderecos_controller.dart';

class EnderecosPage extends StatefulWidget {
  final int userId;
  const EnderecosPage({Key key, @required this.userId}) : super(key: key);

  @override
  _EnderecosPageState createState() => _EnderecosPageState();
}

class _EnderecosPageState
    extends ModularState<EnderecosPage, EnderecosController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      
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
          title: 'Meus Endereços',
          viewLeading: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              TextWidget(
                text: 'Teste',
              ),
            ],
          ),
        ),
    );
  }
}
