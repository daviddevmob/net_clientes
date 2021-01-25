import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/loja/loja_pedido_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_perfil/loja_profile_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/api_erros/hasura_erros_code.dart';

class LojaPerfilRepository implements ILojaPerfil {
  final HasuraConnect api;

  LojaPerfilRepository(this.api);

  @override
  Future<LojaPerfilPageModel> getLoja(int lojaId) async {
    var query = '''
    query MyQuery {
      loja_geral(where: {loja_id: {_eq: $lojaId}}) {
        categoria
        loja_nome
        entrega_domicilio
        loja_fisica
        usuario {
          localizacao {
            mapa_link
            bairro
            endereco
            complemento
          }
          taxa_entrega {
            taxa_entrega
          }
          dias_semana {
            domingo
            quarta
            quinta
            sabado
            segunda
            sexta
            terca
          }
          horario_atendimento {
            domingo
            quarta
            quinta
            sabado
            segunda
            sexta
            terca
          }
          social_links {
            telefone
            whatsapp
          }
          metodo_pagamento {
            alelo_alimentacao
            alelo_refeicao
            american_express
            amex
            dinheiro
            elo
            mastercard
            metodo_pagamento
            sodexo_alimentacao
            sodexo_refeicao
            ticket_alimentacao
            ticket_restaurante
            visa
            metodo_pagamento
          }
        }
        foto_perfil_link
        loja_descricao
        loja_id
        loja_prod_categoria {
          nome_categoria
          loja_prod_categoria_id
        }
        loja_produtos(where: {loja_categoria_prod_id: {_eq: null}, disponivel: {_eq: null}}) {
          descricao
          disponivel
          foto1_link
          foto2_link
          preco
          preco_promo
          produto_nome
          quantidade
          loja_produto_id
          loja_categoria_prod_id
        }
        loja_firebase_id
      }
    }
    ''';

    var data = await api.query(query);
    var result = await data['data']['loja_geral'][0];
    return LojaPerfilPageModel.fromJson(result);
  }

  @override
  Future<bool> veridicaQuantidadeProduto(int produtoId, int quantidade) async {
    var query = '''
    query MyQuery {
      loja_produto(where: {loja_produto_id: {_eq: $produtoId}}) {
        quantidade
      }
    }
    ''';

    var data = await api.query(query);
    int result = await data['data']['loja_produto'][0]['quantidade'];
    if (result >= quantidade) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> fazerPedido(LojaPedidoModel lojaPedidoModel) async {
    try {
      var query = '''
    mutation MyMutation {
      insert_loja_pedido(
        objects: {
          bairro: ${lojaPedidoModel.bairro},
          cliente_firebase_id: "${lojaPedidoModel.clienteFirebaseId}", 
          cliente_id: ${lojaPedidoModel.clienteId}, 
          endereco: "${lojaPedidoModel.endereco}", 
          entrega: ${lojaPedidoModel.entrega}, 
          localizacao: "${lojaPedidoModel.localizacao}", 
          loja_firebase_id: "${lojaPedidoModel.lojaFirebaseId}", 
          loja_id: ${lojaPedidoModel.lojaId}, 
          metodo_pagamento: ${lojaPedidoModel.metodoPagamento}, 
          status_pedido: ${lojaPedidoModel.statusPedido}, 
          taxa_entrega: ${lojaPedidoModel.taxaEntrega}, 
          total_pedido: ${lojaPedidoModel.totalPedido}, 
          troco: "${lojaPedidoModel.troco}"
          }) {
        returning {
          loja_pedido_id
        }
      }
    }
    ''';

      var data = await api.mutation(query);
      int lojaPedidoId = await data['data']['insert_loja_pedido']['returning']
          [0]['loja_pedido_id'];
      int x = 0;
      for (x = 0; x <= lojaPedidoModel.lojaPedidoItems.length; x++) {
        var queryItens = '''
      mutation MyMutation {
        insert_loja_pedido_item(
          objects: {
            cliente_id: ${lojaPedidoModel.clienteId}, 
            loja_pedido_id: $lojaPedidoId, 
            preco_unidade: ${lojaPedidoModel.lojaPedidoItems[x].precoUnidade}, 
            produto_loja_id: ${lojaPedidoModel.lojaPedidoItems[x].produtoLojaId}, 
            quantidade: ${lojaPedidoModel.lojaPedidoItems[x].quantidade}, 
            total: ${lojaPedidoModel.lojaPedidoItems[x].total}
            }) {
          affected_rows
        }
      }
      ''';
        await api.mutation(queryItens);
      }
      int y = 0;
      for (y = 0; y <= lojaPedidoModel.lojaPedidoItems.length; y++) {
        var queryQuantidade = '''
        query MyQuery {
          loja_produto(
            where: {
              loja_produto_id: {_eq: ${lojaPedidoModel.lojaPedidoItems[y].produtoLojaId}}}) {
            quantidade
          }
        }
        ''';
        var data1 = await api.query(queryQuantidade);
        int quantidade = data1['data']['loja_produto'][0]['quantidade'];
        int novaQuantidade;
        if (quantidade == lojaPedidoModel.lojaPedidoItems[y].quantidade) {
          novaQuantidade = 0;
        } else if (quantidade > lojaPedidoModel.lojaPedidoItems[y].quantidade) {
          novaQuantidade =
              quantidade - lojaPedidoModel.lojaPedidoItems[y].quantidade;
        } else {
          novaQuantidade = 0;
        }
        var queryRemove = '''
        mutation MyMutation {
        update_loja_produto(
          where: {
            loja_produto_id: {_eq: ${lojaPedidoModel.lojaPedidoItems[y].produtoLojaId}}}, 
            _set: {quantidade: $novaQuantidade}) {
          affected_rows
            }
          }
        ''';

        await api.mutation(queryRemove);
      }
      return 'ok';
    } on HasuraError catch (e) {
      return getErrorHasuraString(e.message);
    } catch (e) {}
  }
}
