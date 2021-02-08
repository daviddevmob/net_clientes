import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model_profile.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ongs_favoritas/ongs_favoritas_repository_interface.dart';

class OngsFavoritasRepository implements IOngsFavoritas{
  final HasuraConnect api;

  OngsFavoritasRepository(this.api);

  @override
  Stream<OngFavoritasProfile> getOngFavorita(int ongId, int clienteId) {
    var query = '''
    subscription MySubscription {
      cliente_favorita_ong(where: {cliente_id: {_eq: $clienteId}, ong_id: {_eq: $ongId}}) {
        cliente_id
        ativo
      }
    }
    ''';

  
  return api.subscription(query).map((event) {
    return OngFavoritasProfile.fromJson(event['data']);
    });

  }

  @override
  Future salvarFavorito(int ongId, int clienteId) async {
    var query = '''
    mutation MyMutation {
      insert_cliente_favorita_ong(
        objects: {
          ong_id: $ongId, 
          cliente_id: $clienteId}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    }
  
    @override
    Future setFavorito(int ongId, int clienteId, bool value) async {
    var query = '''
    mutation MyMutation {
      update_cliente_favorita_ong(
        where: {
          cliente_id: {_eq: $clienteId}, 
          ong_id: {_eq: $ongId}}, 
          _set: {ativo: $value}) {
        affected_rows
      }
    }
    ''';
    await api.mutation(query);
  }

  @override
  Future<OngsFaviritasModel> getOngs(int clienteId) async  {
    var query = '''
    query MyQuery {
      cliente_favorita_ong(where: {cliente_id: {_eq: $clienteId}, ong_geral: {ong_visibility: {_eq: true}, ong_status: {_eq: true}}, ativo: {_eq: true}}) {
        ong_geral {
          ong_nome
          ong_imagem_perfil
          usuario_id
          ong_id
          usuario {
            localizacao {
              bairro
            }
          }
        }
      }
    }
    ''';

    var data = await api.query(query);
    var result = await data['data'];
    return OngsFaviritasModel.fromJson(result);
  }
}