import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/item_carrinho_model.dart';
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
  Future<String> fazerPedido(LojaPedidoModel lojaPedidoModel,
      ObservableList<ItemCarrinhoModel> itens) async {
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

      int repet = itens.length;
      for (var x = 0; x < repet; x++) {
        double precoUnidade = itens[x].produto.precoPromo != 0 &&
                itens[x].produto.precoPromo < itens[x].produto.preco
            ? itens[x].produto.precoPromo
            : itens[x].produto.preco;
        int quantidade = itens[x].quantidade;
        double total = precoUnidade * quantidade;
        int produtoLojaId = itens[x].produto.lojaProdutoId;
        var queryItens = '''
          mutation MyMutation {
            insert_loja_pedido_item(
              objects: {
                cliente_id: ${lojaPedidoModel.clienteId}, 
                loja_pedido_id: $lojaPedidoId, 
                preco_unidade: $precoUnidade, 
                produto_loja_id: $produtoLojaId, 
                quantidade: $quantidade, 
                total: $total
                }) {
              affected_rows
            }
          }
      ''';
        await api.mutation(queryItens);
        print('Quantidade: $x');
      }

      for (var y = 0; y < repet; y++) {
        int produtoId = itens[y].produto.lojaProdutoId;
        int quantidadeProduto = itens[y].quantidade;
        var queryQuantidade = '''
        query MyQuery {
          loja_produto(
            where: {
              loja_produto_id: {_eq: $produtoId}}) {
            quantidade
          }
        }
        ''';
        var data1 = await api.query(queryQuantidade);
        int quantidade = data1['data']['loja_produto'][0]['quantidade'];
        int novaQuantidade;
        if (quantidade == quantidadeProduto) {
          novaQuantidade = 0;
        } else if (quantidade > quantidadeProduto) {
          novaQuantidade =
              quantidade - quantidadeProduto;
        } else {
          novaQuantidade = 0;
        }
        var queryRemove = '''
        mutation MyMutation {
        update_loja_produto(
          where: {
            loja_produto_id: {_eq: $produtoId}}, 
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
    } catch (e) {
      return e.toString();
    }
  }
}
