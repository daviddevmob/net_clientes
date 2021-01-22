import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/loja/loja_categoria_search.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'lojas_categoria_controller.dart';

class LojasCategoriaPage extends StatefulWidget {
  final LojaCategoriaSearch lojaSearch;
  const LojasCategoriaPage({Key key, @required this.lojaSearch}) : super(key: key);

  @override
  _LojasCategoriaPageState createState() => _LojasCategoriaPageState();
}

class _LojasCategoriaPageState
    extends ModularState<LojasCategoriaPage, LojasCategoriaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: widget.lojaSearch.nomeCategoria,
          viewLeading: true,
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
