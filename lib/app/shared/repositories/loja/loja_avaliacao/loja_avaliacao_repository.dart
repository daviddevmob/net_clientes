import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_avaliacao/loja_avaliacao_repository_interface.dart';

class LojaAvaliacaoRepository implements ILojaAvaliacao{
  final HasuraConnect api;

  LojaAvaliacaoRepository(this.api);
  @override
  Future addAvaliacao(int clienteId, int lojaId, int pedidoId, double nota, String text)  async {
    var query = '''
    mutation MyMutation {
      insert_loja_avaliacao(
        objects: {
          cliente_id: $clienteId, 
          pedido_id: $pedidoId, 
          loja_id: $lojaId, 
          nota: $nota, 
          texto: "$text"}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);

    return 'ok';
    }
  
    @override
    Future editAvaliacao(int avaliacaoId, double nota, String text) async {
    var query = '''
    mutation MyMutation {
      update_loja_avaliacao(
        where: {
          loja_avaliacao_id: {_eq: $avaliacaoId}}, 
          _set: {
            nota: $nota, 
            texto: "$text"
            }) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);

    return 'ok';
  }

}