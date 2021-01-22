import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/repositories/loja/pedidos_loja/pedidos_loja_repository.dart';

part 'pedidos_loja_controller.g.dart';

@Injectable()
class PedidosLojaController = _PedidosLojaControllerBase
    with _$PedidosLojaController;

abstract class _PedidosLojaControllerBase with Store {
  final IPedidosLoja iPedidosLoja;

  _PedidosLojaControllerBase(this.iPedidosLoja);

  @observable
  ObservableStream<PedidosLojaModel> pedidos;

  @action
  getPedidosLojaUser(int clienteId) {
    pedidos = iPedidosLoja.getPedidosLoja(clienteId).asObservable();
  }
}
