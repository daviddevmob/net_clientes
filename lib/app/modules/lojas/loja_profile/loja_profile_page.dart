import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'loja_profile_controller.dart';

class LojaProfilePage extends StatefulWidget {
  final LojaProfileModel lojaProfile;
  const LojaProfilePage({Key key, @required this.lojaProfile}) : super(key: key);

  @override
  _LojaProfilePageState createState() => _LojaProfilePageState();
}

class _LojaProfilePageState
    extends ModularState<LojaProfilePage, LojaProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Loja',
          viewLeading: true,
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
