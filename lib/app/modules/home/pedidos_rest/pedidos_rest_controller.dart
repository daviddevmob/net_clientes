import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/pedidos_rest/pedidos_rest_repository_interface.dart';

part 'pedidos_rest_controller.g.dart';

@Injectable()
class PedidosRestController = _PedidosRestControllerBase
    with _$PedidosRestController;

abstract class _PedidosRestControllerBase with Store {
  final IPedidosRest iPedidosRest;

  _PedidosRestControllerBase(this.iPedidosRest);

  @observable
  ObservableStream<PedidosRestModel> pedidos;

  @action
  getPedidos(int clienteId) {
    pedidos = iPedidosRest.getPedidos(clienteId).asObservable();
  }
}
