import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/rest_produto_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';

class RestProfileRepository implements IRestProfile{
  final HasuraConnect api;

  RestProfileRepository(this.api);
  @override
  Future<RestProfile> getRest(int restId) async {
    var query = '''
    query MyQuery {
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
          rest_produtos {
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
      }
    }
    ''';
    var data = await api.query(query);
    var result = await data['data']['rest_geral'][0];
    return RestProfile.fromJson(result);
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
  Future<String> fazerPedido() {
    // TODO: implement fazerPedido
    throw UnimplementedError();
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

}