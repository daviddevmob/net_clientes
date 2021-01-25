import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:latlong/latlong.dart';

class GeolocalizacaoRepository implements IGeo {
  final HasuraConnect api;

  GeolocalizacaoRepository(this.api);

  final Distance distance = Distance();

  @override
  Future getLocalizacao(String url) async {
    await canLaunch(url);
    print(url);
    await launch(url);
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
    int clienteId,
    String endereco,
    String latlng,
    String complemento,
    int bairro,
  ) async {
    try {
      var query = '''
    mutation MyMutation {
      insert_endereco_cliente(
        objects: {
          bairro: $bairro, 
          cliente_id: $clienteId, 
          complemento: "$complemento", 
          endereco: "$endereco", 
          latlgn: "$latlng"
          }) {
        affected_rows
      }
    }

    ''';

      await api.mutation(query);
      return 'ok';
    } catch (e) {
      return '$e';
    }
  }

  @override
  Future<String> deleteLocalizacaoMaps(int enderecoId) async {
    try {
      var query = '''
      mutation MyMutation {
        delete_endereco_cliente(
          where: {
            endereco_id: {_eq: $enderecoId}}) {
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

  @override
  Future<String> updateEnderecoPrincipal(int clienteId, int enderecoId) async {
    var query = '''
    mutation MyMutation {
      update_cliente(
        where: {
          cliente_id: {_eq: $clienteId}}, 
          _set: {endereco_id: $enderecoId}) {
        affected_rows
      }
    }
    ''';

    await api.mutation(query);
    return 'ok';
  }

  @override
  getDistacia(double userLat, double userLong, double lat, double lng) async {
    final double distancia = distance.as(
      LengthUnit.Kilometer,
      LatLng(userLat, userLong),
      LatLng(lat, lng),
    );

    return distancia;
  }
}
