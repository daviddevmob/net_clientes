import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favoritos_model.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository_interface.dart';

class RestsFavotirosRepository implements IRestFavoritos{
  final HasuraConnect api;

  RestsFavotirosRepository(this.api);
  @override
  Future<RestFavoritoModel> getFavoritos(int clienteId) {
    var query = '''
    subscription MySubscription {
      cliente_favorito_rest(where: {cliente_id: {_eq: $clienteId}}) {
        ativo
        cliente_id
        rest_id
      }
    }
    ''';
  }

  @override
  Future<RestFavoritoModel> getLojas(int clienteId) {
      // TODO: implement getLojas
      throw UnimplementedError();
    }
  
    @override
    Future<String> salvarFavorito(int lojaId, int clienteId) async {
    var query = '''
    mutation MyMutation {
      insert_cliente_favorito_rest(
        objects: {
          cliente_id: $clienteId, 
          rest_id: $lojaId
          }) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }
  
    @override
    Stream<RestFavoritoModelProfile> setFavoritos(int lojaId, int clienteId) {
      var query = '''
      subscription MySubscription {
        cliente_favorito_rest(where: {cliente_id: {_eq: $lojaId}, rest_id: {_eq: $clienteId}}) {
          ativo
          cliente_id
        }
      }
      ''';
      return api.subscription(query).map((event) {
      return RestFavoritoModelProfile.fromJson(event['data']);
    });
    }
  
    @override
    Future<String> setStatusFavorito(int clienteId, int lojaId, bool status) async {
    var query = '''
    mutation MyMutation {
    update_cliente_favorito_rest(
      where: {
        cliente_id: {_eq: $clienteId}, 
        rest_id: {_eq: $lojaId}}, 
        _set: {ativo: $status}) {
      affected_rows
    }
  }
    ''';

    await api.mutation(query);
    return 'ok';
  }

}