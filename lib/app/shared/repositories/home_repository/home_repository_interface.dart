import 'dart:io';

import 'package:net_cliente/app/shared/models/cliente_model.dart';

abstract class IHome {
  Stream<ClienteModel> getCliente(String email);
  Future<String> updateCliente(ClienteModel clienteModel);
  Future<String> updateFotoPerfil(File imageProfile, int clienteId);
}
