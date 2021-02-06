import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/pedidos_rest/pedidos_rest_repository_interface.dart';

class PedidosRestRepository implements IPedidosRest{
  final HasuraConnect api;

  PedidosRestRepository(this.api);
  @override
  Stream<PedidosRestModel> getPedidos(int clienteId) {
    var query = '''
    subscription MySubscription {
      cliente(where: {cliente_id: {_eq: $clienteId}}) {
        rest_pedidos(order_by: {rest_pedido_id: desc}) {
          aviso
          bairro
          criado_em
          endereco
          entrega
          localizacao
          metodo_pagamento
          status_pedido
          taxa_entrega
          total_pedido
          troco
          numero_pedido
          rest_id
          rest_pedido_id
          rest_item_pedidos {
            preco_unidade
            quantidade
            total
            rest_produto {
              foto
              nome
              descricao
            }
            complementos
            opcoes_produto
          }
          rest_geral {
            rest_nome
            usuario {
              localizacao {
                bairro
                complemento
                endereco
                mapa_link
              }
            }
          }
          entregador_id
          entregador {
            nome
            foto_link
          }
        }
      }
    }
    ''';

    return api.subscription(query).map((value) {
      return PedidosRestModel.fromJson(value['data']['cliente'][0]);
    });
  }

}