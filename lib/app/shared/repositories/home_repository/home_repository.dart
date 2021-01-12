import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
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
    subscription MySubscription {
      cliente(where: {email: {_eq: "$email"}}) {
        bairro
        cliente_id
        cpf
        email
        status
        nome
        foto_perfil
        firebase_id
        whatsapp
      }
    }
    ''';
    return api.subscription(query).map((value) {
      return ClienteModel.fromJson(value['data']['cliente'][0]);
    });
  }

  @override
  Future<String> updateCliente(ClienteModel clienteModel) async {
    try {
      var query = '''
        mutation MyMutation {
          update_cliente(
            where: {
              cliente_id: {_eq: ${clienteModel.clienteId}}},
               _set: {
                 bairro: ${clienteModel.bairro}, 
                 nome: "${clienteModel.nome}", 
                 whatsapp: "${clienteModel.whatsapp}"
                 }) {
            affected_rows
          }
        }
        ''';

      await api.mutation(query);

      return clienteModel.clienteId.toString();
    } catch (e) {
      return 'erro';
    }
  }

  @override
  Future<String> updateFotoPerfil(File imageProfile, int clienteId) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('clientes/$clienteId/').child('image-perfil');

    TaskSnapshot storageTaskSnapshot = await reference.putFile(imageProfile);

    String linkImage = await storageTaskSnapshot.ref.getDownloadURL();

    var query = '''
    mutation MyMutation {
      update_cliente(
        where: {cliente_id: {_eq: $clienteId}}, 
        _set: {
          foto_perfil: "$linkImage"}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'salvo';
  }
}
