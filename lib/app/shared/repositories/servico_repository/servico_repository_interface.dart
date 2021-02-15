import 'package:net_cliente/app/shared/models/servicos/servico_avaliacao_profile.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';

abstract class IServico {
  Future<ServicosSearchModel> getServicos(
    int categoria,
    String text,
    int bairro,
  );
  Future<ServicoModel> getServico(int userId);
  Stream<ServicoAvaliacaoProfile> getAvaliacao(int clienteId, int servicoId);
  Future editAvaliacao( int avaliacaoId, double nota, String text);
  Future addAvaliacao(int clienteId, int servicoId, double nota, String text);
}
