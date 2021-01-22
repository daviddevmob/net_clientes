import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';

class LojaProfileModel {
  final ClienteModel cliente;
  final EnderecoClienteHome endereco;
  final LojaGeral lojaGeral;

  LojaProfileModel(this.cliente, this.endereco, this.lojaGeral);
}
