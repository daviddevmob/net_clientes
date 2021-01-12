import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurantes_controller.dart';

class RestaurantesPage extends StatefulWidget {
  final String title;
  const RestaurantesPage({Key key, this.title = "Restaurantes"})
      : super(key: key);

  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState
    extends ModularState<RestaurantesPage, RestaurantesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container()
    );
  }
}
