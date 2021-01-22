import 'dart:io';

import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_model.dart';

abstract class IHome {
  Stream<ClienteModel> getCliente(String email);
  Future<String> updateCliente(ClienteModel clienteModel);
  Future<String> updateFotoPerfil(File imageProfile, int clienteId);
  Stream<List<EnderecoClienteModel>> getEnderecosCliente(int clienteId);
  Future<String> addEndereco(
    int clienteId,
    int bairro,
    String endereco,
    String latlng,
    String complemento,
  );
  Stream<EnderecoClienteHome> getEnderecoClienteHome(int clienteId, int enderecoId);
}
