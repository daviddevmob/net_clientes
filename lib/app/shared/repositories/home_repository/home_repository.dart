import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/api_erros/hasura_erros_code.dart';

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
        endereco_id
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
    } on HasuraError catch (e) {
      return getErrorHasuraString(e.message);
    } catch (e) {
      return 'erro';
    }
  }

  @override
  Future<String> updateFotoPerfil(File imageProfile, int clienteId) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('clientes/$clienteId/')
        .child('image-perfil');

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

  @override
  Stream<List<EnderecoClienteModel>> getEnderecosCliente(int clienteId) {
    var query = '''
    subscription MySubscription {
      endereco_cliente(where: {cliente_id: {_eq: $clienteId}}) {
        cliente_id
        complemento
        endereco
        endereco_id
        latlgn
        bairro
      }
    }
    ''';

    return api.subscription(query).map((event) {
      return (event['data']['endereco_cliente'] as List).map((e) {
        return EnderecoClienteModel.fromJson(e);
      }).toList();
    });
  }

  @override
  Future<String> addEndereco(int clienteId, int bairro, String endereco,
      String latlng, String complemento) {
    var query = '''
    mutation MyMutation {
      insert_endereco_cliente(
        objects: {
          bairro: $bairro, 
          cliente_id: $clienteId, 
          complemento: "$complemento", 
          endereco: "$endereco", 
          latlgn: "$latlng"}) {
        affected_rows
      }
    }
    ''';
  }

  @override
  Stream<EnderecoClienteHome> getEnderecoClienteHome(
      int clienteId, int enderecoId) {
    var query = '''
    subscription MySubscription {
      endereco_cliente(
        where: {cliente_id: {_eq: $clienteId}, 
        endereco_id: {_eq: $enderecoId}}) {
        bairro
        cliente_id
        complemento
        endereco
        endereco_id
        latlgn
      }
    }
   ''';
    return api.subscription(query).map((value) {
      return EnderecoClienteHome.fromJson(value['data']['endereco_cliente'][0]);
    });
  }
}
