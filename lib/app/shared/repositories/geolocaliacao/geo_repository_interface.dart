import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';

abstract class IGeo {
  Future getLocalizacao(String url);
  Future deleteLocalizacao(int enderecoId);
  getDistacia(
    double userLat, 
    double userLong, 
    double lat, 
    double lng,
    );
  Future<GoogleMapsLocalizacaoModel> getGoogleMapsLocalizacaoModel(
      String endereco);
  Future<String> salvarLocalizacao(int clienteId, String endereco,
      String latlng, String complemento, int bairro);
  Future<String> deleteLocalizacaoMaps(int localizacaoId);
  Future<String> updateEnderecoPrincipal(int clienteId, int enderecoId);
}
