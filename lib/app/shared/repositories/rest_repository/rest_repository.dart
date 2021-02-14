import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/rest/list_rest.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_repository_interface.dart';

class RestRepository implements IRestRepository{
  final HasuraConnect api;

  RestRepository(this.api);

  @override
  Stream<RestListModel> getRestList(
    bool domicilio, 
    bool lojaFisica, 
    int categoria, 
    String text, 
    int bairro,
    ) {
      String params;
    if (text != '' || text != null) {
      params = text;
    }
    var query = '''
    subscription MyQuery {
      rest_geral(
        where: {
          status: {_eq: true}, 
          visibility: {_eq: true}, 
          retirada_loja: {_eq: $lojaFisica}, 
          entrega_domicilio: {_eq: $domicilio}, 
          categoria: {_eq: $categoria}, 
          _or: [
            {rest_nome: {_ilike: "%$params%"}}, 
            {rest_produtos: {nome: {_ilike: "%$params%"}}, 
            rest_prod_categoria: 
            {nome_categoria: {_ilike: "%$params%"}}}], 
            usuario: 
            {localizacao: {_not: {mapa_link: {_eq: ""}}, 
            bairro: {_eq: $bairro}}},
            _not: {usuario: {localizacao: {mapa_link: {_eq: ""}}}}}) {
        categoria
        rest_nome
        entrega_domicilio
        retirada_loja
        foto_link
        rest_id
        usuario {
          localizacao {
            mapa_link
            bairro
          }
          taxa_entrega {
            taxa_entrega
          }
        }
        rest_avaliacaos {
          nota
        }
      }
    }
    ''';

    return api.subscription(query).map((event){
      return RestListModel.fromJson(event['data']);
    });
  }

}