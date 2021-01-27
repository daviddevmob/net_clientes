import 'package:net_cliente/app/modules/lojas/loja_profile/loja_profile_controller.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';

class CarrinhoLojaPageModel {
  final LojaProfileController controller;
  final double taxaEntrega;
  final double distanciaEntrega;
  final List<MetodosPagamentoAceitos> metodos;
  final int tipoEntrega;
  final LojaProfileModel lojaProfileModule;
  final bool aberto;
  CarrinhoLojaPageModel(
    this.controller,
    this.taxaEntrega,
    this.distanciaEntrega,
    this.metodos,
    this.tipoEntrega,
    this.lojaProfileModule,
    this.aberto,
  );
}

class MetodosPagamentoAceitos {
  final int metodoId;
  final String nomeMetodo;

  MetodosPagamentoAceitos(this.metodoId, this.nomeMetodo);
}
