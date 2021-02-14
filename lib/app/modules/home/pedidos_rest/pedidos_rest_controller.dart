import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/pedidos_rest/pedidos_rest_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao/rest_avaliacao_repository_interface.dart';

part 'pedidos_rest_controller.g.dart';

@Injectable()
class PedidosRestController = _PedidosRestControllerBase
    with _$PedidosRestController;

abstract class _PedidosRestControllerBase with Store {
  final IPedidosRest iPedidosRest;
  final IRestAvaliacao iRestAvaliacao;

  _PedidosRestControllerBase(this.iPedidosRest, this.iRestAvaliacao);

  @observable
  ObservableStream<PedidosRestModel> pedidos;

  @observable
  double editAvaliacao;

  @observable
  TextEditingController editarTextAvaliacao = TextEditingController();
  
  @observable
  double novaAvaliacao = 5.0;

  @observable
  TextEditingController novaTextAvaliacao = TextEditingController();

  @action
  getPedidos(int clienteId) {
    pedidos = iPedidosRest.getPedidos(clienteId).asObservable();
  }

  @action
  setEditAvaliacao(int clienteId, int restId, int pedidoId, int avaliacaoId) async {
    await iRestAvaliacao.editAvaliacao(
      clienteId, 
      restId, 
      pedidoId, 
      avaliacaoId, 
      editAvaliacao, 
      editarTextAvaliacao.text,
      );
    editAvaliacao = null;
    editarTextAvaliacao.clear();
  }

  @action
  setEditNota(double newValue) => editAvaliacao = newValue;

  @action
  addAvalicao(int clienteId, int restId, int pedidoId) async {
    await iRestAvaliacao.saveAvaliacao(
      clienteId, 
      restId, 
      pedidoId, 
      novaAvaliacao, 
      novaTextAvaliacao.text == null ? "" : novaTextAvaliacao.text,
      );
      novaTextAvaliacao.clear();
      novaAvaliacao = 5.0;
  }

  @action
  setNovaNota(double newValue) => novaAvaliacao = newValue;
}
