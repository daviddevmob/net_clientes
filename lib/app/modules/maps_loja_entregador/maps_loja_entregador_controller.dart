import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/entregador_loja/entregador_loja_localizacao.dart';
import 'package:net_cliente/app/shared/models/googlemaps_localizacao_model.dart';
import 'package:net_cliente/app/shared/repositories/entregador_loja_repository/entregador_loja_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:uuid/uuid.dart';

part 'maps_loja_entregador_controller.g.dart';

@Injectable()
class MapsLojaEntregadorController = _MapsLojaEntregadorControllerBase
    with _$MapsLojaEntregadorController;

abstract class _MapsLojaEntregadorControllerBase with Store {
  final IEntregadorLoja iEntregadorLoja;

  _MapsLojaEntregadorControllerBase(this.iEntregadorLoja);

  @observable
  ObservableStream<EntregadorLojaLocalizacaoModel> entregador;

  @observable
  GoogleMapsLocalizacaoModel localizacaoModel;

  @observable
  GoogleMapController googleMapsController;

  @observable
  String mapStyle;

  @observable
  BitmapDescriptor sourceIcon;

  @observable
  BitmapDescriptor destinationIcon;

  @observable
  double clienteLat;

  @observable
  double  clienteLng;

  @observable
  LatLng center = LatLng(-3.8898971, -38.4536488);

  @observable
  Set<Marker> markers = new Set<Marker>();

  @observable
  Set<Polyline> polylines = {};

  @observable
  PolylinePoints polylinePoints = PolylinePoints();

  @observable
  List <LatLng> polylineCoordinates = [];

  @computed
  Set<Marker> get pinos {
    Set<Marker> p = new Set<Marker>();
    if(localizacaoEntregador != null){
      p.add(Marker(
      markerId: MarkerId('Entregador'),
      position: localizacaoEntregador,
      icon: sourceIcon));
    }
    p.add(Marker(
      markerId: MarkerId('Você'),
      position: center,
      icon: destinationIcon));

    return p;
  }

  @action
  criarMapa(GoogleMapController controller) async {
    googleMapsController = controller;
    googleMapsController.setMapStyle(mapStyle);
  }

  @action
  setMapPins() {
    markers.add(Marker(
      markerId: MarkerId('sourcePin'),
      position: localizacaoEntregador,
      icon: sourceIcon));
    markers.add(Marker(
      markerId: MarkerId('destPin'),
      position: center,
      icon: destinationIcon));
      
  }


  @action
  setPolylines() async {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          "AIzaSyAENKIoR3T2YuAtkjSbCpB1jixzUi5pTVk",
          PointLatLng(
            center.latitude, 
            center.longitude,
          ),
          PointLatLng(
            localizacaoEntregador.latitude, 
            localizacaoEntregador.longitude,
          ),
        );
      if (result.points.isNotEmpty) {
          result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
      }

      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Cores.verdeClaro,
          points: polylineCoordinates,
          width: 6,
          );

          polylines.add(polyline);
     
  }

  @computed
  bool get movimento {
    LatLng locAtual = 
    LatLng(entregador.value.entregadorLocalizacao.lat, entregador.value.entregadorLocalizacao.lgt);

    if(locAtual != localizacaoEntregador){
      return true;
    } else{
      return false;
    }
  }


  @action
  setSourceAndDestinationIcons() async { 
   sourceIcon = await BitmapDescriptor.fromAssetImage ( 
      ImageConfiguration(devicePixelRatio: 2.5), 
      'assets/driving_pin.png');
   destinationIcon = 
      await BitmapDescriptor.fromAssetImage (ImageConfiguration (devicePixelRatio: 2.5), 
      'assets/destination_map_marker.png'); 
  }

  @action
  setLocalizacaoAtual() async {

    center =  LatLng(
      clienteLat,
      clienteLng,
    );
  }

  @computed
  LatLng get localizacaoEntregador {
    if(entregador.data != null){
      LatLng loc = LatLng(
        entregador.value.entregadorLocalizacao.lat,
        entregador.value.entregadorLocalizacao.lgt,
      );;
      return loc;
    }
    return null;
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
  getEntregador(int entregadorId, int pedidoId) {
    entregador = iEntregadorLoja.getLocalizacao(entregadorId, pedidoId).asObservable();
  }
}
