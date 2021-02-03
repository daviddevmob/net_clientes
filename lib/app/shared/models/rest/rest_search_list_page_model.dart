import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';

class RestSearch{
  final ClienteModel cliente;
  final EnderecoClienteHome endereco;

  RestSearch(this.cliente, this.endereco);
}