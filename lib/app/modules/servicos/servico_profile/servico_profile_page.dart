import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'servico_profile_controller.dart';

class ServicoProfilePage extends StatefulWidget {
  final String title;
  const ServicoProfilePage({Key key, this.title = "ServicoProfile"})
      : super(key: key);

  @override
  _ServicoProfilePageState createState() => _ServicoProfilePageState();
}

class _ServicoProfilePageState
    extends ModularState<ServicoProfilePage, ServicoProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
