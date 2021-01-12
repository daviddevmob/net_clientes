import 'package:eusebio_project/app/shared/models/geo_google_maps_model.dart';
import 'package:eusebio_project/app/shared/models/servico_models/servico_user_model.dart';
import 'package:eusebio_project/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

part 'maps_controller.g.dart';

@Injectable()
class MapsController = _MapsControllerBase with _$MapsController;

abstract class _MapsControllerBase with Store {
  final IGeo iGeo;

  _MapsControllerBase(this.iGeo);

  @observable
  GoogleMapsLocalizacaoModel localizacaoModel;

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  bool verBotaoSalvar = false;

  @observable
  Localizacao localizacao;

  @observable
  MapType mapType = MapType.normal;

  @observable
  GoogleMapController googleMapsController;

  @observable
  LatLng center = LatLng(-3.8898971, -38.4536488);

  @observable
  Set<Marker> markers = new Set<Marker>();

  @observable
  int bairro;

  @observable
  TextEditingController complementoController = TextEditingController();

  @action
  criarMapa(GoogleMapController controller) {
    googleMapsController = controller;
  }

  @action
  pesquisarLocalizacao() async {
    if (enderecoController.text == null || enderecoController.text == '') {
      print('erro');
    } else {
      localizacaoModel =
          await iGeo.getGoogleMapsLocalizacaoModel(enderecoController.text);
      center = LatLng(
        localizacaoModel.candidates[0].geometry.location.lat,
        localizacaoModel.candidates[0].geometry.location.lng,
      );

      await setMapPosition(
        localizacaoModel.candidates[0].name,
        localizacaoModel.candidates[0].formattedAddress,
      );
      verBotaoSalvar = true;
    }
  }

  @action
  setLocalizacaoAtual() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    center = LatLng(
      position.latitude,
      position.longitude,
    );

    setMapPosition('Você', 'Seu negócio está aqui?');
  }

  @action
  setMapPosition(titulo, snippet) async {
    await googleMapsController.animateCamera(CameraUpdate.newLatLng(center));
    markers = Set<Marker>();

    final uuid = Uuid();
    Marker marker = Marker(
        markerId: MarkerId('${uuid.v4()}'),
        position: center,
        infoWindow: InfoWindow(title: titulo, snippet: snippet));

    markers.add(marker);
  }

  @action
  searchLocal(String endereco) async {
    localizacaoModel = await iGeo.getGoogleMapsLocalizacaoModel(endereco);
  }

  @action
  tirarMostrarPesquisa() {
    verBotaoSalvar = false;
  }

  @action
  deleteLocalizacaoMaps(int localizacaoId) async {
    await iGeo.deleteLocalizacaoMaps(localizacaoId);
  }

  @action
  salvarLocalizacao(int localizacaoId) async {
    var lat = '${localizacaoModel.candidates[0].geometry.location.lat}';
    var lng = '${localizacaoModel.candidates[0].geometry.location.lng}';
    var save = await iGeo.salvarLocalizacao(
      localizacaoId,
      localizacaoModel.candidates[0].formattedAddress,
      '$lat,$lng',
      complementoController.text,
      bairro,
    );
    print(save);
    return save;
  }
}
