import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favoritos_model.dart';
import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository_interface.dart';

class LojasFavotirasRepository implements ILojasFavoritas {
  final HasuraConnect api;

  LojasFavotirasRepository(this.api);

  @override
  Future<LojaFavotiraModel> getLojas(int clienteId) async {
    var query = '''
    query MyQuery {
      cliente_favorito_loja(where: {cliente_id: {_eq: $clienteId}}) {
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
    var result  = await data['data'];
    return LojaFavotiraModel.fromJson(result);
  }
}
