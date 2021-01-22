import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/repositories/loja/pedidos_loja/pedidos_loja_repository.dart';

class PedidosLojaRepository implements IPedidosLoja {
  final HasuraConnect api;

  PedidosLojaRepository(this.api);

  @override
  Stream<PedidosLojaModel> getPedidosLoja(int clienteId) {
    var query = '''
      subscription MySubscription {
        cliente(where: {cliente_id: {_eq: $clienteId}}) {
          loja_pedidos(order_by: {loja_pedido_id: desc}) {
            atualizado_em
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
            loja_id
            loja_pedido_id
            loja_pedido_items {
              preco_unidade
              quantidade
              total
              loja_produto {
                foto1_link
                produto_nome
                descricao
              }
            }
            loja_geral {
              loja_nome
            }
          }
        }
      }
    ''';
    return api.subscription(query).map((value) {
      return PedidosLojaModel.fromJson(value['data']['cliente'][0]);
    });
  }
}
