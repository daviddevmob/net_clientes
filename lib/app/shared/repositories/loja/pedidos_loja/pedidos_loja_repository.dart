import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';

abstract class IPedidosLoja{
  Stream<PedidosLojaModel> getPedidosLoja(int clienteId);
}
