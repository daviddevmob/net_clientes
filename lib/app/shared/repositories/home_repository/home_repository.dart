import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';

class HomeRepository implements IHome {
  final HasuraConnect api;

  HomeRepository(this.api);

  @override
  // ignore: missing_return
  Stream<ClienteModel> getCliente(String email) {
    var query = '''
    query MyQuery {
      cliente(where: {email: {_eq: "$email"}}) {
        bairro
        cliente_id
        cpf
        email
        nome
        firebase_id
        status
        whatsapp
      }
    }
    ''';
    api.mutation(query).then((value) {
      return ClienteModel.fromJson(value['data']['cliente'][0]);
    });
  }
}
