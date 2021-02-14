import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/rest_produto_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';

class RestProfileRepository implements IRestProfile{
  final HasuraConnect api;

  RestProfileRepository(this.api);
  @override
  Stream<RestProfile> getRest(int restId) {
    var query = '''
    subscription MyQuery {
      rest_geral(where: {rest_id: {_eq: $restId}}) {
        categoria
        rest_nome
        entrega_domicilio
        retirada_loja
        usuario {
          firebase_id
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
        foto_link
        rest_descricao
        rest_id
        rest_firebase_id
        rest_prod_categoria(where: {}) {
          nome_categoria
          rest_adicionals {
            preco
            nome
          }
          rest_produtos(where: {disponivel: {_eq: true}, quantidade: {_neq: 0}}) {
            descricao
            disponivel
            foto
            nome
            preco
            preco_promo
            rest_categoria_id
            rest_produto_id
          }
        }
        rest_avaliacaos {
          nota
        }
      }
    }
    ''';
    return api.subscription(query).map((event){
      return RestProfile.fromJson(event['data']['rest_geral'][0]);
    });
  }

  @override
  Future<bool> veridicaQuantidadeProduto(int produtoId, int quantidade) async {
    var query = '''
    query MyQuery {
      rest_produto(where: {rest_produto_id: {_eq: $produtoId}}) {
        quantidade
      }
    }
    ''';

    var data = await api.query(query);
    int result = await data['data']['rest_produto'][0]['quantidade'];
    if (result >= quantidade) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> fazerPedido(PedidoRestModel pedidoRestModel)  async {
    try{
      var query = '''
    mutation MyMutation {
      insert_rest_pedido(
        objects: {
          cliente_firebase_id: "${pedidoRestModel.clienteFirebaseId}", 
          cliente_id: ${pedidoRestModel.clienteId}, 
          endereco: "${pedidoRestModel.endereco}", 
          entrega: ${pedidoRestModel.entrega}, 
          localizacao: "${pedidoRestModel.localizacao}", 
          metodo_pagamento: ${pedidoRestModel.metodoPagamento}, 
          rest_id: ${pedidoRestModel.restId}, 
          status_pedido: 1, 
          taxa_entrega: ${pedidoRestModel.taxaEntrega}, 
          total_pedido: ${pedidoRestModel.totalPedido}, 
          troco: "${pedidoRestModel.troco}", 
          bairro: "${pedidoRestModel.bairro}"
          }) {
            returning {
          rest_pedido_id
        }
      }
    }
    ''';
    var data = await api.mutation(query);
    int pedidoId = data['data']['insert_rest_pedido']['returning'][0]['rest_pedido_id'];
    int tamanho = pedidoRestModel.produtos.length;
    for(var x = 0; x < tamanho; x++){
      print('loop');
      var i = pedidoRestModel.produtos[x];
      var itemPedido = '''
        mutation MyMutation {
          insert_rest_item_pedido(
            objects: {
              cliente_id: ${pedidoRestModel.clienteId}, 
              complementos: "${i.complementos}", 
              opcoes_produto: "${i.opcoes}", 
              preco_unidade: ${i.precoUnidade}, 
              produto_rest_id: ${i.produtoId}, 
              quantidade: 1, 
              rest_pedido_id: $pedidoId, 
              total: ${i.total}
              }) {
            affected_rows
          }
        }
    ''';

      await api.mutation(itemPedido);
    
      var quantidade = '''
      query MyQuery {
        rest_produto(
          where: {
            rest_produto_id: {_eq: ${i.produtoId}}
            }) {
          quantidade
        }
      }
      ''';
      
      var dataQntProduto = await api.query(quantidade);
      int qnt = await dataQntProduto['data']['rest_produto'][0]['quantidade'];

      if(qnt > 1){

        int qntAtt = qnt -1;
        var editProduto = '''
        mutation MyMutation {
          update_rest_produto(
            where: {
              rest_produto_id: {_eq: ${i.produtoId}}}, 
              _set: {quantidade: $qntAtt}) {
            affected_rows
          }
        }
        ''';

        await api.mutation(editProduto);
      } else if(qnt == 1){

        var editProduto = '''
        mutation MyMutation {
          update_rest_produto(
            where: {
              rest_produto_id: {_eq: ${i.produtoId}}}, 
              _set: {quantidade: 0}) {
            affected_rows
          }
        }
        ''';

        await api.mutation(editProduto);
      } else{
        print('sem estoque');
      }
      
    }

    return 'ok';
    }on HasuraError catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }catch(e){
      print('ERRO: $e : ' +e.toString());
    }
    
  }

  @override
  Future<RestProdutoProfile> getProdutoView(int produtoId, int categoriaId) async {
    var query = '''
    query MyQuery {
      rest_categoria(where: {rest_categoria_id: {_eq: $categoriaId}}) {
        rest_adicionals(where: {disponivel: {_eq: true}}) {
          nome
          preco
        }
        rest_produtos(where: {rest_produto_id: {_eq: $produtoId}}) {
          descricao
          disponivel
          foto
          nome
          preco
          preco_promo
          quantidade
          rest_opcaos {
            opcao_nome
            rest_opcao_items {
              item_preco
              item_nome
              rest_opcao_item_id
            }
            rest_opcao_id
          }
        }
      }
    }
    ''';
    
    var data = await api.query(query);
    return RestProdutoProfile.fromJson(data['data']['rest_categoria'][0]);
  }

  @override
  Future addProdutoCarrinho(
    int clienteId, 
    int restId, 
    int produtoId, 
    double preco, 
    double total,
    int quantidade, 
    String  complementos,
    String opcoes,
    String clienteFirebaseId,)  async {
    var verCarrinho = '''
    query MyQuery {
      rest_pedido(
        where: {
          rest_id: {_eq: $restId}, 
          cliente_id: {_eq: $clienteId},
          status_pedido: {_eq: 0}}) {
        rest_pedido_id
      }
    }
    ''';

    var data = await api.query(verCarrinho);
    var result = await data['data']['rest_pedido'];

    if(result != '[]'){
      int pedidoId = await data['data']['rest_pedido'][0]['rest_pedido_id'];
      var salvarProduto =  '''
      mutation MyMutation {
        insert_rest_item_pedido(
          objects: {
            cliente_id: $clienteId, 
            complementos: "$complementos", 
            opcoes_produto: "$opcoes", 
            preco_unidade: $preco, 
            produto_rest_id: $produtoId, 
            quantidade: $quantidade, 
            rest_pedido_id: $pedidoId, 
            total: $total
            }) {
          affected_rows
        }
      }
      ''';

      await api.mutation(salvarProduto);
      return 'ok';
    } else{
      var criarCarrinho = '''
      mutation MyMutation {
      insert_rest_pedido(
        objects: {
          cliente_firebase_id: "$clienteFirebaseId", 
          cliente_id: $clienteId, 
          rest_id: $restId, 
          status_pedido: 0
          }) {
        returning {
          rest_pedido_id
        }
      }
    }
      ''';

      var data = await api.mutation(criarCarrinho);
      int pedidoId = await data['data']['insert_rest_pedido']['returning'][0]['rest_pedido_id'];

      var salvarProduto =  '''
      mutation MyMutation {
        insert_rest_item_pedido(
          objects: {
            cliente_id: $clienteId, 
            complementos: "$complementos", 
            opcoes_produto: "$opcoes", 
            preco_unidade: $preco, 
            produto_rest_id: $produtoId, 
            quantidade: $quantidade, 
            rest_pedido_id: $pedidoId, 
            total: $total
            }) {
          affected_rows
        }
      }
      ''';

      await api.mutation(salvarProduto);
      return 'ok';
    }

  }

}