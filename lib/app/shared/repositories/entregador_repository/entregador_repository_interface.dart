import 'package:net_cliente/app/shared/models/entregador/entregador_localizacao.dart';

abstract class IEntregador {
  Stream<EntregadorLocalizacaoModel> getLocalizacao(int entregadorId, int pedidoId);
}