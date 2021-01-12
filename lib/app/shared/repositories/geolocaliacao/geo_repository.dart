import 'package:geolocator/geolocator.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

class GeolocalizacaoRepository implements IGeo {
  final HasuraConnect api;

  GeolocalizacaoRepository(this.api);

  @override
  Future getLocalizacao(String url) async {
    await canLaunch(url);
    print(url);
    await launch(url);
  }

  @override
  Future<String> attLocalizacao(int ongId) async {
    Position position = await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
      desiredAccuracy: LocationAccuracy.best,
    );
    double lat = position.latitude;
    double long = position.longitude;
    String url = 'https://maps.google.com/?q=$lat,$long';
    print(url);
    var query = '''
    mutation MyMutation {
      update_ong_geral(where: {ong_id: {_eq: $ongId}}, _set: {ong_mapa_link: "$url"}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }

  @override
  Future deleteLocalizacao(int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(where: {ong_id: {_eq: $ongId}}, _set: {ong_mapa_link: null}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
  }

  @override
  Future<GoogleMapsLocalizacaoModel> getGoogleMapsLocalizacaoModel(
      String endereco) async {
    try {
      String enderecoEncode = Uri.encodeQueryComponent(endereco);
      String porta = 'AIzaSyBvIG3H9Ysx-422dT1jCmgtSlhPo9_GvP8';
      String url =
          "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$enderecoEncode&inputtype=textquery&fields=formatted_address,name,rating,geometry&key=$porta";

      Response response = await Dio().get(url);

      return GoogleMapsLocalizacaoModel.fromJson(response.data);
    } catch (e) {
      return e;
    }
  }

  @override
  Future<String> salvarLocalizacao(
      int localizacaoId, 
      String endereco, 
      String mapaLink,
      String complemento,
      int bairro,
      ) async {
    try {
      var query = '''
    mutation MyMutation {
    update_localizacao(
      where: {localizacao_id: {_eq: $localizacaoId}}, 
      _set: {
        endereco: "$endereco", 
        mapa_link: "$mapaLink",
        complemento: "$complemento",
        bairro: $bairro
        }) {
        affected_rows
      }
    }
    ''';

      await api.mutation(query);
      return 'ok';
    } catch (e) {
      return 'erro';
    }
  }

  @override
  Future<String> deleteLocalizacaoMaps(int localizacaoId) async {
    try {
      var query = '''
      mutation MyMutation {
        delete_localizacao(
          where: {
            localizacao_id: {_eq: $localizacaoId}}) {
          returning {
            complemento
          }
        }
      }
    ''';
      await api.mutation(query);
      return 'ok';
    } catch (e) {
      return 'erro';
    }
  }
}
