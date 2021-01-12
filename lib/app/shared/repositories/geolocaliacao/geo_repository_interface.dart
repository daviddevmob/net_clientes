import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';

abstract class IGeo {
  Future getLocalizacao(String url);
  Future<String> attLocalizacao(int ongId);
  Future deleteLocalizacao(int ongId);
  Future<GoogleMapsLocalizacaoModel> getGoogleMapsLocalizacaoModel(
      String endereco);
  Future<String> salvarLocalizacao(
      int localizacaoId, 
      String endereco, 
      String mapaLink,
      String complemento,
      int bairro
      );
  Future<String> deleteLocalizacaoMaps(int localizacaoId);
}
