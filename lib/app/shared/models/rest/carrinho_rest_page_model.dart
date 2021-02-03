import 'package:net_cliente/app/modules/restaurantes/rest_profile/rest_profile_controller.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile.dart';

class CarrinhoRestPageModel {
  final RestProfileController controller;
  final double taxaEntrega;
  final double distanciaEntrega;
  final List<MetodosPagamentoAceitos> metodos;
  final int tipoEntrega;
  final RestProfilePageModel restProfileModule;
  final bool aberto;
  CarrinhoRestPageModel(
    this.controller,
    this.taxaEntrega,
    this.distanciaEntrega,
    this.metodos,
    this.tipoEntrega,
    this.restProfileModule,
    this.aberto,
  );
}

class MetodosPagamentoAceitos {
  final int metodoId;
  final String nomeMetodo;

  MetodosPagamentoAceitos(this.metodoId, this.nomeMetodo);
}