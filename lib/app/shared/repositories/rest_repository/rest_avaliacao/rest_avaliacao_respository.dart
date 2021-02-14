import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao/rest_avaliacao_repository_interface.dart';

class RestAvaliacaoRepository implements IRestAvaliacao {

  final HasuraConnect api;

  RestAvaliacaoRepository(this.api);


  @override
  Future editAvaliacao(int clienteId, int restId, int pedidoId, int avaliacaoId, double nota, String text) async {
    var query = '''
    mutation MyMutation {
      update_rest_avaliacao(
        where: {
          cliente_id: {_eq: $clienteId}, 
          rest_id: {_eq: $restId}, 
          rest_avaliacao_id: {_eq: $avaliacaoId}, 
          pedido_id: {_eq: $pedidoId}}, 
          _set: {
            texto: "$text", 
            nota: $nota}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }

  @override
  Future saveAvaliacao(int clienteId, int restId, int pedidoId, double nota, String text) async {
    var query = '''
    mutation MyMutation {
      insert_rest_avaliacao(
        objects: {
          cliente_id: $clienteId, 
          nota: $nota, 
          pedido_id: $pedidoId, 
          rest_id: $restId, 
          texto: "$text"
          }) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
  }

  

}