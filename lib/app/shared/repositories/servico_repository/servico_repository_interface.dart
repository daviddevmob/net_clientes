import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';

abstract class IServico {
  Future<ServicosSearchModel> getServicos();
  Future<ServicosSearchModel> getServicosCategoria(int categoria);
  Future<ServicosSearchModel> getServicosBairro(int bairro);
  Future<ServicosSearchModel> getServicosCategoriaBairro(
      int categoria, int bairro);
}
