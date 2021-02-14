import 'package:net_cliente/app/shared/models/entregador_loja/entregador_loja_localizacao.dart';

abstract class IEntregadorLoja {
  Stream<EntregadorLojaLocalizacaoModel> getLocalizacao(int entregadorId, int pedidoId);
}