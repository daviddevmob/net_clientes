import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';

abstract class IServico {
  Future<ServicosSearchModel> getServicos();
  Future<ServicosSearchModel> getServicosCategoria(int categoria);
  Future<ServicosSearchModel> getServicosBairro(int bairro);
  Future<ServicosSearchModel> getServicosCategoriaBairro(
    int categoria,
    int bairro,
  );
  Future<ServicosSearchModel> getServicosNome(String nome);
  Future<ServicosSearchModel> getServicosNomeCategoria(
    String nome,
    int categoria,
  );
  Future<ServicosSearchModel> getServicosNomeBairro(String nome, int bairro);
  Future<ServicosSearchModel> getServicosNomeCategoriaBairro(
    String nome,
    int categoria,
    int bairro,
  );
  Future<ServicoModel> getServico(int userId);
}
