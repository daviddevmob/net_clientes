import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/rest/list_rest.dart';

class RestProfilePageModel{
  final ClienteModel cliente;
  final EnderecoClienteHome endereco;
  final RestGeral restGeral;

  RestProfilePageModel(this.cliente, this.endereco, this.restGeral);
}