import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/loja/loja_categoria_search.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ButtonsCategoriasLojaWidget extends StatelessWidget {
  final ClienteModel clienteModel;
  final EnderecoClienteHome endereco;
  final String nomeCategoria;
  final int categoriaId;
  final IconData icon;
  final String title;

  const ButtonsCategoriasLojaWidget({Key key, this.clienteModel, this.endereco, this.nomeCategoria, this.categoriaId, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          LojaCategoriaSearch lojaCategoriaSearch = new LojaCategoriaSearch(
            clienteModel,
            endereco,
            nomeCategoria,
            categoriaId,
          );
          Modular.to
              .pushNamed('/lojas_categoria/', arguments: lojaCategoriaSearch);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                icon,
                ),
               Container(
                 padding: EdgeInsets.only(
                   left: 10,
                   right: 10,
                 ),
                 child: TextWidget(
                    text: title,
                    fontSize: 13,
                    textColor: Colors.black,
                          ),
               ),
            ],
          ),
        ),
    );
  }
}
