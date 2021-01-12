import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/maps/maps_controller.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';

class SearchAppBar extends StatelessWidget {
  final MapsController controller;

  SearchAppBar({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Observer(
          builder: (_) => TextFieldWidget(
                textEditingController: controller.enderecoController,
                hintText: 'Insira seu endereço com número',
                onSubmit: (value) {
                  controller.pesquisarLocalizacao();
                },
              )),
      centerTitle: true,
      leading: FlatButton(
        onPressed: controller.verBotaoSalvar == true
            ? () {
                controller.enderecoController.clear();
                controller.verBotaoSalvar = false;
              }
            : () {
                controller.pesquisarLocalizacao();
              },
        child: Observer(
          builder: (_) => Icon(
            controller.verBotaoSalvar ? Icons.close : Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
