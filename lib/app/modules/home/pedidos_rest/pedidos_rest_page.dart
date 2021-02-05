import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pedidos_rest_controller.dart';

class PedidosRestPage extends StatefulWidget {
  final String title;
  const PedidosRestPage({Key key, this.title = "PedidosRest"})
      : super(key: key);

  @override
  _PedidosRestPageState createState() => _PedidosRestPageState();
}

class _PedidosRestPageState
    extends ModularState<PedidosRestPage, PedidosRestController> {
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
