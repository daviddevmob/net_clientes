
import 'package:net_cliente/app/shared/models/rest/rest_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favoritos_model.dart';

abstract class IRestFavoritos{
  Future<RestFavoritoModelList> getLojas(int clienteId);
  Stream<RestFavoritoModelProfile> setFavoritos(int lojaId, int clienteId);
  Future<String> salvarFavorito(int lojaId, int clienteId);
  Future<String> setStatusFavorito(int clienteId, int lojaId, bool status);
}