import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/entregador/entregador_localizacao.dart';
import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';
import 'package:net_cliente/app/shared/repositories/entregador_repository/entregador_repository_interface.dart';
import 'package:uuid/uuid.dart';

part 'maps_entregador_controller.g.dart';

@Injectable()
class MapsEntregadorController = _MapsEntregadorControllerBase
    with _$MapsEntregadorController;

abstract class _MapsEntregadorControllerBase with Store {
  final IEntregador iEntregador;

  _MapsEntregadorControllerBase(this.iEntregador);

  @observable
  ObservableStream<EntregadorLocalizacaoModel> entregador;

  @observable
  GoogleMapsLocalizacaoModel localizacaoModel;

  @observable
  GoogleMapController googleMapsController;

  @observable
  String mapStyle;

  @observable
  double clienteLat;

  @observable
  double  clienteLng;

  @observable
  LatLng center = LatLng(-3.8898971, -38.4536488);

  @observable
  Set<Marker> markers = new Set<Marker>();

  @action
  criarMapa(GoogleMapController controller) {
    googleMapsController = controller;
    googleMapsController.setMapStyle(mapStyle);
  }

  @action
  setLocalizacaoAtual() async {

    center =  LatLng(
      clienteLat,
      clienteLng,
    );
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
  getLocalizacao(int entregadorId, int pedidoId) {
    entregador = iEntregador.getLocalizacao(entregadorId, pedidoId).asObservable();
  }
}
