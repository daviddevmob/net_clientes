import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'totem_controller.dart';

class TotemPage extends StatefulWidget {
  final String title;
  const TotemPage({Key key, this.title = "Totem"}) : super(key: key);

  @override
  _TotemPageState createState() => _TotemPageState();
}

class _TotemPageState extends ModularState<TotemPage, TotemController> {
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
