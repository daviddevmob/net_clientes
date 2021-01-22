import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';

class LojaCategoriaSearch {
  final ClienteModel clienteModel;
  final EnderecoClienteHome endereco;
  final String nomeCategoria;
  final int categoriaId;

  LojaCategoriaSearch(
    this.clienteModel,
    this.endereco,
    this.nomeCategoria,
    this.categoriaId,
  );
}
