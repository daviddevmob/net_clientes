import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/entregador_loja/entregador_loja_localizacao.dart';
import 'package:net_cliente/app/shared/repositories/entregador_loja_repository/entregador_loja_repository_interface.dart';

class EntregadorLojaRepository implements IEntregadorLoja {

  final HasuraConnect api;

  EntregadorLojaRepository(this.api);

  @override
  Stream<EntregadorLojaLocalizacaoModel> getLocalizacao(int entregadorId, int pedidoId) {
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
        loja_pedidos(where: {loja_pedido_id: {_eq: $pedidoId}}) {
          status_pedido
        }
      }
    }
    ''';

    return api.subscription(query).map((event){
      return EntregadorLojaLocalizacaoModel.fromJson(event['data']['entregador'][0]);
    });
  }
}