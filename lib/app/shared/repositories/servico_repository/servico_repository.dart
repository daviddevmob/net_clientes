import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/api_erros/hasura_erros_code.dart';

class ServicosRepository implements IServico {
  final HasuraConnect api;

  ServicosRepository(this.api);

  @override
  Future<ServicosSearchModel> getServicos(
    int categoria,
    String text,
    int bairro,) async {
      String params;
    if (text != '' || text != null) {
      params = text;
    }
    try {
      var query = '''
      query MyQuery {
      servico_geral(
        where: {
          servico_status: {_eq: true}, 
          servico_visibility: {_eq: true}, 
          categoria: {_eq: $categoria}, 
          _or: [
            {
              servico_nome: {_ilike: "%$params%"}, 
              servico_descricao: {_ilike: "%$params%"}}], 
        usuario: {localizacao: {bairro: {_eq: $bairro}}}}) {
        categoria
        servico_nome
        servico_foto_perfil
        usuario_id
        servico_id
        }
      }

      ''';

      var data = await api.query(query);
      var result = await data['data'];
      return ServicosSearchModel.fromJson(result);
    } catch (e) {
      return e;
    }
  }

 
  @override
  // ignore: missing_return
  Future<ServicoModel> getServico(int userId) async {
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
        social_links {
          email
          instagram
          telefone
          whatsapp
        }
        servico_geral {
          servico_descricao
          servico_domicilio
          servico_foto_capa
          servico_foto_perfil
          categoria
          servico_fotos {
            descricao
            link
          }
          servico_local
          servico_nome
          servico_lists {
            servico_nome
            servico_preco
            servico_tempo
          }
        }
      }
    }
    ''';
      var data = await api.query(query);
      var result = await data['data'];
      return ServicoModel.fromJson(result);
    } on HasuraError catch (e) {
      print('HASURA ERRO: ' + getErrorHasuraString(e.message));
    } catch (e) {
      print('CATCH ERRO: ' + e);
      return e;
    }
  }

 
}
