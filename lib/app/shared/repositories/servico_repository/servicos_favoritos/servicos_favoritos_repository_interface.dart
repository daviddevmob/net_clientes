import 'package:net_cliente/app/shared/models/servicos/servico_favorito_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_favorito_profile_model.dart';

abstract class IServicosFavoritos {
  Future<ServicoFavoritoModel> getLojas(int clienteId);
  Stream<ServicoFavoritoModelProfile> setFavoritos(int lojaId, int clienteId);
  Future<String> salvarFavorito(int lojaId, int clienteId);
  Future<String> setStatusFavorito(int clienteId, int lojaId, bool status);
}
