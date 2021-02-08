import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model_profile.dart';

abstract class IOngsFavoritas{
  Stream<OngFavoritasProfile> getOngFavorita(int ongId, int clienteId);
  Future setFavorito(int ongId, int clienteId, bool value);
  Future salvarFavorito(int ongId, int clienteId);
  Future<OngsFaviritasModel> getOngs(int clienteId);
}