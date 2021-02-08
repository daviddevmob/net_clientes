import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_favorito_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_favorito_profile_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository_interface.dart';

class ServicosFavoritosRepository implements IServicosFavoritos {
  final HasuraConnect api;

  ServicosFavoritosRepository(this.api);

  @override
  Future<ServicoFavoritoModel> getLojas(int clienteId) async {
     var query = '''
     query MyQuery {
      clente_favorito_servico(where: {ativo: {_eq: true}, servico_geral: {servico_visibility: {_eq: true}, servico_status: {_eq: true}}}) {
        servico_id
        servico_geral {
          categoria
          servico_nome
          usuario_id
          servico_id
          servico_foto_perfil
        }
      }
    }
     ''';

    var data = await api.query(query);
    var result = await data['data'];
    return ServicoFavoritoModel.fromJson(result);
    }
  
    @override
    Future<String> salvarFavorito(int lojaId, int clienteId) async {
    var query = '''
    mutation MyMutation {
      insert_clente_favorito_servico(
        objects: {
          cliente_id: $clienteId, 
          servico_id: $lojaId
          }) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }
  
    @override
    Stream<ServicoFavoritoModelProfile> setFavoritos(int lojaId, int clienteId) {
      var query = '''
      subscription MySubscription {
        clente_favorito_servico(
          where: {
            cliente_id: {_eq: $clienteId}, 
            servico_id: {_eq: $lojaId}}) {
          cliente_id
          ativo
        }
      }
      ''';

       return api.subscription(query).map((event) {
      return ServicoFavoritoModelProfile.fromJson(event['data']);
    });
    }
  
    @override
    Future<String> setStatusFavorito(int clienteId, int lojaId, bool status) async {
        var query = '''
        mutation MyMutation {
        update_clente_favorito_servico(
          where: {
            cliente_id: {_eq: $clienteId}, 
            servico_id: {_eq: $lojaId}}, 
            _set: {ativo: $status}) {
          affected_rows
        }
      }
        ''';

    await api.mutation(query);
    return 'ok';
  }


 
}
