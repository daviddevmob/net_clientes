import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';
import 'package:net_cliente/app/shared/repositories/loja/list_lojas/list_lojas_repository_interface.dart';

class ListLojasRepository implements IListLojas {
  final HasuraConnect api;

  ListLojasRepository(this.api);
  @override
  Future<ListLojasModel> getLojas(
    bool domicilio,
    bool lojaFisica,
    int categoria,
    String text,
    int bairro
  ) async {
    String params;
    text == null || text == '' ? params = null : params = "%$text%";

    var query = '''
    query MyQuery {
        loja_geral(
          where: {
            status: {_eq: true}, 
            visibility: {_eq: true}, 
            loja_fisica: {_eq: $lojaFisica}, 
            entrega_domicilio: {_eq: $domicilio}, 
            categoria: {_eq: $categoria}, 
            _or: [
              {loja_nome: {_ilike: $params}}, 
              {loja_produtos: {produto_nome: {_ilike: $params}}, 
              loja_prod_categoria: {nome_categoria: {_ilike: $params}}}], 
              usuario: {
                localizacao: {
                  bairro: {_eq: $bairro}}}
                  }) {
          categoria
          loja_nome
          entrega_domicilio
          loja_fisica
          foto_perfil_link
          loja_id
          usuario {
            localizacao {
              mapa_link
              bairro
            }
            taxa_entrega {
              taxa_entrega
            }
          }
        }
      }
    ''';

    var data = await api.query(query);
    var result  = await data['data'];
    return ListLojasModel.fromJson(result);
  }
}
