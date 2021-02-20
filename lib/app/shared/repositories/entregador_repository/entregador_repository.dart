import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/entregador/entregador_localizacao.dart';
import 'package:net_cliente/app/shared/repositories/entregador_repository/entregador_repository_interface.dart';

class EntregadorRepository implements IEntregador{
  final HasuraConnect api;

  EntregadorRepository(this.api);

  @override
  Stream<EntregadorLocalizacaoModel> getLocalizacao(int entregadorId, int pedidoId) {
    var query = '''
    subscription MySubscription {
      entregador(where: {entregador_id: {_eq: $entregadorId}}) {
        foto_link
        nome
        entregador_localizacao {
          lat
          lgt
          ativo
        }
        rest_pedidos(where: {rest_pedido_id: {_eq: $pedidoId}}) {
          status_pedido
          entregador_id
        }
        entregador_id
      }
    }
    ''';

    return api.subscription(query).map((event){
      return EntregadorLocalizacaoModel.fromJson(event['data']['entregador'][0]);
    });
  }

}