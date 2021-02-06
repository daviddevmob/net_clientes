import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';

abstract class IPedidosRest{
  Stream<PedidosRestModel> getPedidos(int clienteId);
}