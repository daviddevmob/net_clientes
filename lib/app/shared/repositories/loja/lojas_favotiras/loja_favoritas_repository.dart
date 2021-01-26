import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favoritos_model.dart';
import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository_interface.dart';

class LojasFavotirasRepository implements ILojasFavoritas {
  final HasuraConnect api;

  LojasFavotirasRepository(this.api);

  @override
  Future<LojaFavotiraModel> getLojas(int clienteId) async {
    var query = '''
    query MyQuery {
      cliente_favorito_loja(where: {cliente_id: {_eq: $clienteId}, ativo: {_eq: true}}) {
        loja_geral {
          categoria
          loja_nome
          entrega_domicilio
          loja_fisica
          foto_perfil_link
          usuario {
            localizacao {
              mapa_link
              bairro
            }
            taxa_entrega {
              taxa_entrega
            }
          }
          loja_id
        }
      }
    }
    ''';

    var data = await api.query(query);
    var result = await data['data'];
    return LojaFavotiraModel.fromJson(result);
  }

  @override
  Stream<LojaFavoritaModelProfile> setFavoritos(int lojaId, int clienteId) {
    var query = '''
    subscription MyQuery {
      cliente_favorito_loja(
        where: {
          loja_id: {_eq: $lojaId}, 
          cliente_id: {_eq: $clienteId}}) {
        cliente_favorito_loja_id
        ativo
      }
    }
    ''';

    return api.subscription(query).map((event) {
      return LojaFavoritaModelProfile.fromJson(event['data']);
    });
  }

  @override
  Future<String> setStatusFavorito(
      int clienteId, int lojaId, bool status) async {
    var query = '''
    mutation MyMutation {
    update_cliente_favorito_loja(
      where: {
        cliente_id: {_eq: $clienteId}, 
        loja_id: {_eq: $lojaId}}, 
        _set: {ativo: $status}) {
      affected_rows
    }
  }
    ''';

    await api.mutation(query);
    return 'ok';
  }

  @override
  Future<String> salvarFavorito(int lojaId, int clienteId) async {
    var query = '''
    mutation MyMutation {
      insert_cliente_favorito_loja(
        objects: {
          cliente_id: $clienteId, 
          loja_id: $lojaId
          }) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }
}
