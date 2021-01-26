import 'package:net_cliente/app/modules/lojas/loja_profile/loja_profile_controller.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';

class LojaViewProduto {
  final LojaProduto produto;
  final LojaProfileController controller;

  LojaViewProduto(this.produto, this.controller);
}
