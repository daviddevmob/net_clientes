import 'package:net_cliente/app/shared/models/loja/loja_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favoritos_model.dart';

abstract class ILojasFavoritas {
  Future<LojaFavotiraModel> getLojas(int clienteId);
  Stream<LojaFavoritaModelProfile> setFavoritos(int lojaId, int clienteId);
  Future<String> salvarFavorito(int lojaId, int clienteId);
  Future<String> setStatusFavorito(int clienteId, int lojaId, bool status);
}
