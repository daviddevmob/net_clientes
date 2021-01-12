import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';

class OngRepository implements IOng {
  final HasuraConnect api;

  OngRepository(this.api);

  @override
  Future<OngSearchModel> getOng() async {
    try {
      var query = '''
    query MyQuery {
      usuario(
        where: {
          tipo_conta: {_eq: "ong"}, 
          ong_geral: {ong_visibility: {_eq: true}, 
          ong_status: {_eq: true}}}) {
        localizacao {
          bairro
        }
        ong_geral {
          ong_nome
          ong_descricao
          ong_imagem_perfil
          usuario_id
        }
      }
    }
    ''';
      var data = await api.query(query);
      var result = await data['data'];
      return OngSearchModel.fromJson(result);
    } catch (e) {
      return e;
    }
  }

  @override
  Future<OngSearchModel> getOngBairro(int bairro) async {
    try {
      var query = '''
    query MyQuery {
      usuario(
        where: {tipo_conta: {_eq: "ong"}, 
        ong_geral: {ong_visibility: {_eq: true}, 
        ong_status: {_eq: true}}, 
        localizacao: {bairro: {_eq: $bairro}}}) {
        localizacao {
          bairro
        }
        ong_geral {
          ong_nome
          ong_descricao
          ong_imagem_perfil
          usuario_id
        }
      }
    }
    ''';
      var data = await api.query(query);
      var result = await data['data'];
      return OngSearchModel.fromJson(result);
    } catch (e) {
      return e;
    }
  }

  @override
  Future<OngModel> getOngProfile(int userId) async {
    try {
      var query = '''
    query MyQuery {
      usuario(where: {usuario_id: {_eq: $userId}}) {
        dias_semana {
          domingo
          quarta
          quinta
          sabado
          segunda
          semana_id
          sexta
          terca
        }
        horario_atendimento {
          domingo
          horario_id
          quarta
          quinta
          sabado
          segunda
          sexta
          terca
        }
        localizacao {
          bairro
          complemento
          endereco
          mapa_link
        }
        ong_geral {
          ong_descricao
          ong_imagem_capa
          ong_imagem_perfil
          ong_nome
          ong_id
          ong_fotos {
            ong_foto_descricao
            ong_foto_link
            ong_foto_id
          }
          ong_contrubiocaos {
            contribuicao_id
            texto
          }
        }
        social_links {
          email
          instagram
          telefone
          whatsapp
        }
      }
    }
    ''';
      var data = await api.query(query);
      var result = await data['data'];
      return OngModel.fromJson(result);
    } catch (e) {
      print('ERRO ONG: ' + e.toString());
      return e;
    }
  }
}
