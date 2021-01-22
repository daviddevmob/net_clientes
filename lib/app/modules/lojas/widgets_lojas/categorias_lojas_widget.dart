import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:net_cliente/app/modules/lojas/widgets_lojas/buttons_list_categorias.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';

class CategoriasLojasWidget extends StatelessWidget {
  final LojasSearch lojasSearch;

  const CategoriasLojasWidget({Key key, this.lojasSearch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 1,
            nomeCategoria: 'Alimentos e Bebidas',
            title: 'Alimentos e Bebidas',
            icon: FontAwesomeIcons.hamburger,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 2,
            nomeCategoria: 'Automativo',
            title: 'Automativo',
            icon: FontAwesomeIcons.car,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 3,
            nomeCategoria: 'Bebês',
            title: 'Bebês',
            icon: FontAwesomeIcons.babyCarriage,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 4,
            nomeCategoria: 'Beleza e Cuidados Pessoais',
            title: 'Beleza e Cuidados Pessoais',
            icon: FontAwesomeIcons.keybase,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 5,
            nomeCategoria: 'Casa, Jardim e Limpeza',
            title: 'Casa, Jardim e Limpeza',
            icon: FontAwesomeIcons.home,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 6,
            nomeCategoria: 'Celulares e Comunicação',
            title: 'Celulares e Comunicação',
            icon: FontAwesomeIcons.phoneAlt,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 7,
            nomeCategoria: 'Computadores e Informática',
            title: 'Computadores e Informática',
            icon: FontAwesomeIcons.desktop,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 8,
            nomeCategoria: 'Eletrônicos, TV e Áudio',
            title: 'Eletrônicos, TV e Áudio',
            icon: FontAwesomeIcons.tv,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 9,
            nomeCategoria: 'Ferramentas e Construção',
            title: 'Ferramentas e Construção',
            icon: FontAwesomeIcons.hammer,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 10,
            nomeCategoria: 'Papelaria e Escritório',
            title: 'Papelaria e Escritório',
            icon: FontAwesomeIcons.book
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 11,
            nomeCategoria: 'Pet Shop',
            title: 'Pet Shop',
            icon: FontAwesomeIcons.paw,
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          ButtonsCategoriasLojaWidget(
            clienteModel: lojasSearch.cliente,
            endereco: lojasSearch.endereco,
            categoriaId: 12,
            nomeCategoria: 'Roupas, Calçados e Acessórios',
            title: 'Roupas, Calçados e Acessórios',
            icon: FontAwesomeIcons.personBooth,
          ),
        ],
      ),
    );
  }
}
