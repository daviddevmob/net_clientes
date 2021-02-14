import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_avaliacao/loja_avaliacao_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/loja/pedidos_loja/pedidos_loja_repository.dart';

part 'pedidos_loja_controller.g.dart';

@Injectable()
class PedidosLojaController = _PedidosLojaControllerBase
    with _$PedidosLojaController;

abstract class _PedidosLojaControllerBase with Store {
  final IPedidosLoja iPedidosLoja;
  final ILojaAvaliacao iLojaAvaliacao;

  _PedidosLojaControllerBase(this.iPedidosLoja, this.iLojaAvaliacao);

  @observable
  ObservableStream<PedidosLojaModel> pedidos;

  @observable
  double editAvaliacao;

  @observable
  double novaAvaliacao = 5.0;

  @observable
  TextEditingController editarTextAvaliacao = TextEditingController();

  @observable
  TextEditingController novaTextAvaliacao = TextEditingController();

  @action
  setEditNota(double newValue) => editAvaliacao = newValue;

  @action
  setNovaNota(double newvalue) => novaAvaliacao = newvalue;

  @action
  setEditAvaliacao(int clienteId, int restId, int pedidoId, int avaliacaoId) async {
    await iLojaAvaliacao.editAvaliacao(
      avaliacaoId, 
      editAvaliacao, 
      editarTextAvaliacao.text == null ? "" : editarTextAvaliacao.text,
      );
      editarTextAvaliacao.clear();
      editAvaliacao = null;
      return "ok";
  }

  @action
  addAvaliacao(int clienteId, int lojaId, int pedidoId) async {
    await iLojaAvaliacao.addAvaliacao(
      clienteId, 
      lojaId, 
      pedidoId, 
      novaAvaliacao, 
      novaTextAvaliacao.text == null ? "" : novaTextAvaliacao.text,
      );
      novaAvaliacao = 5.0;
      novaTextAvaliacao.clear();
      return 'ok';
  }

  @action
  getPedidosLojaUser(int clienteId) {
    pedidos = iPedidosLoja.getPedidosLoja(clienteId).asObservable();
  }
}
