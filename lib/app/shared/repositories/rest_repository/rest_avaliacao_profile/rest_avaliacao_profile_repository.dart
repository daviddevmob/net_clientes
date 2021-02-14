import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/rest_avaliacao/rest_avaliacao_profile.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao_profile/rest_avaliacao_profile_repository_interface.dart';

class RestAvaliacaoRepository implements IRestAvaliacaoProfile{
  final HasuraConnect api;

  RestAvaliacaoRepository(this.api);
  @override
  Stream<RestAvaliacaoProfile> getRestAvaliacaoProfile(int restId) {
    var query = '''
    subscription MyQuery {
      rest_avaliacao(where: {rest_id: {_eq: $restId}}) {
        nota
        texto
        cliente {
          nome
          bairro
        }
        rest_comentario_avaliacao {
          text
        }
        rest_geral {
          rest_nome
        }
        criado_em
      }
    }
    ''';
    return api.subscription(query).map((event){
      return  RestAvaliacaoProfile.fromJson(event['data']);
    });
  }
  
}