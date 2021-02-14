// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_loja_entregador_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsLojaEntregadorController
    on _MapsLojaEntregadorControllerBase, Store {
  Computed<Set<Marker>> _$pinosComputed;

  @override
  Set<Marker> get pinos =>
      (_$pinosComputed ??= Computed<Set<Marker>>(() => super.pinos,
              name: '_MapsLojaEntregadorControllerBase.pinos'))
          .value;
  Computed<bool> _$movimentoComputed;

  @override
  bool get movimento =>
      (_$movimentoComputed ??= Computed<bool>(() => super.movimento,
              name: '_MapsLojaEntregadorControllerBase.movimento'))
          .value;
  Computed<LatLng> _$localizacaoEntregadorComputed;

  @override
  LatLng get localizacaoEntregador => (_$localizacaoEntregadorComputed ??=
          Computed<LatLng>(() => super.localizacaoEntregador,
              name: '_MapsLojaEntregadorControllerBase.localizacaoEntregador'))
      .value;

  final _$entregadorAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.entregador');

  @override
  ObservableStream<EntregadorLojaLocalizacaoModel> get entregador {
    _$entregadorAtom.reportRead();
    return super.entregador;
  }

  @override
  set entregador(ObservableStream<EntregadorLojaLocalizacaoModel> value) {
    _$entregadorAtom.reportWrite(value, super.entregador, () {
      super.entregador = value;
    });
  }

  final _$localizacaoModelAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.localizacaoModel');

  @override
  GoogleMapsLocalizacaoModel get localizacaoModel {
    _$localizacaoModelAtom.reportRead();
    return super.localizacaoModel;
  }

  @override
  set localizacaoModel(GoogleMapsLocalizacaoModel value) {
    _$localizacaoModelAtom.reportWrite(value, super.localizacaoModel, () {
      super.localizacaoModel = value;
    });
  }

  final _$googleMapsControllerAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.googleMapsController');

  @override
  GoogleMapController get googleMapsController {
    _$googleMapsControllerAtom.reportRead();
    return super.googleMapsController;
  }

  @override
  set googleMapsController(GoogleMapController value) {
    _$googleMapsControllerAtom.reportWrite(value, super.googleMapsController,
        () {
      super.googleMapsController = value;
    });
  }

  final _$mapStyleAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.mapStyle');

  @override
  String get mapStyle {
    _$mapStyleAtom.reportRead();
    return super.mapStyle;
  }

  @override
  set mapStyle(String value) {
    _$mapStyleAtom.reportWrite(value, super.mapStyle, () {
      super.mapStyle = value;
    });
  }

  final _$sourceIconAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.sourceIcon');

  @override
  BitmapDescriptor get sourceIcon {
    _$sourceIconAtom.reportRead();
    return super.sourceIcon;
  }

  @override
  set sourceIcon(BitmapDescriptor value) {
    _$sourceIconAtom.reportWrite(value, super.sourceIcon, () {
      super.sourceIcon = value;
    });
  }

  final _$destinationIconAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.destinationIcon');

  @override
  BitmapDescriptor get destinationIcon {
    _$destinationIconAtom.reportRead();
    return super.destinationIcon;
  }

  @override
  set destinationIcon(BitmapDescriptor value) {
    _$destinationIconAtom.reportWrite(value, super.destinationIcon, () {
      super.destinationIcon = value;
    });
  }

  final _$clienteLatAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.clienteLat');

  @override
  double get clienteLat {
    _$clienteLatAtom.reportRead();
    return super.clienteLat;
  }

  @override
  set clienteLat(double value) {
    _$clienteLatAtom.reportWrite(value, super.clienteLat, () {
      super.clienteLat = value;
    });
  }

  final _$clienteLngAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.clienteLng');

  @override
  double get clienteLng {
    _$clienteLngAtom.reportRead();
    return super.clienteLng;
  }

  @override
  set clienteLng(double value) {
    _$clienteLngAtom.reportWrite(value, super.clienteLng, () {
      super.clienteLng = value;
    });
  }

  final _$centerAtom = Atom(name: '_MapsLojaEntregadorControllerBase.center');

  @override
  LatLng get center {
    _$centerAtom.reportRead();
    return super.center;
  }

  @override
  set center(LatLng value) {
    _$centerAtom.reportWrite(value, super.center, () {
      super.center = value;
    });
  }

  final _$markersAtom = Atom(name: '_MapsLojaEntregadorControllerBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$polylinesAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.polylines');

  @override
  Set<Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(Set<Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  final _$polylinePointsAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.polylinePoints');

  @override
  PolylinePoints get polylinePoints {
    _$polylinePointsAtom.reportRead();
    return super.polylinePoints;
  }

  @override
  set polylinePoints(PolylinePoints value) {
    _$polylinePointsAtom.reportWrite(value, super.polylinePoints, () {
      super.polylinePoints = value;
    });
  }

  final _$polylineCoordinatesAtom =
      Atom(name: '_MapsLojaEntregadorControllerBase.polylineCoordinates');

  @override
  List<LatLng> get polylineCoordinates {
    _$polylineCoordinatesAtom.reportRead();
    return super.polylineCoordinates;
  }

  @override
  set polylineCoordinates(List<LatLng> value) {
    _$polylineCoordinatesAtom.reportWrite(value, super.polylineCoordinates, () {
      super.polylineCoordinates = value;
    });
  }

  final _$criarMapaAsyncAction =
      AsyncAction('_MapsLojaEntregadorControllerBase.criarMapa');

  @override
  Future criarMapa(GoogleMapController controller) {
    return _$criarMapaAsyncAction.run(() => super.criarMapa(controller));
  }

  final _$setPolylinesAsyncAction =
      AsyncAction('_MapsLojaEntregadorControllerBase.setPolylines');

  @override
  Future setPolylines() {
    return _$setPolylinesAsyncAction.run(() => super.setPolylines());
  }

  final _$setSourceAndDestinationIconsAsyncAction = AsyncAction(
      '_MapsLojaEntregadorControllerBase.setSourceAndDestinationIcons');

  @override
  Future setSourceAndDestinationIcons() {
    return _$setSourceAndDestinationIconsAsyncAction
        .run(() => super.setSourceAndDestinationIcons());
  }

  final _$setLocalizacaoAtualAsyncAction =
      AsyncAction('_MapsLojaEntregadorControllerBase.setLocalizacaoAtual');

  @override
  Future setLocalizacaoAtual() {
    return _$setLocalizacaoAtualAsyncAction
        .run(() => super.setLocalizacaoAtual());
  }

  final _$setMapPositionAsyncAction =
      AsyncAction('_MapsLojaEntregadorControllerBase.setMapPosition');

  @override
  Future setMapPosition(dynamic titulo, dynamic snippet) {
    return _$setMapPositionAsyncAction
        .run(() => super.setMapPosition(titulo, snippet));
  }

  final _$_MapsLojaEntregadorControllerBaseActionController =
      ActionController(name: '_MapsLojaEntregadorControllerBase');

  @override
  dynamic setMapPins() {
    final _$actionInfo = _$_MapsLojaEntregadorControllerBaseActionController
        .startAction(name: '_MapsLojaEntregadorControllerBase.setMapPins');
    try {
      return super.setMapPins();
    } finally {
      _$_MapsLojaEntregadorControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEntregador(int entregadorId, int pedidoId) {
    final _$actionInfo = _$_MapsLojaEntregadorControllerBaseActionController
        .startAction(name: '_MapsLojaEntregadorControllerBase.getEntregador');
    try {
      return super.getEntregador(entregadorId, pedidoId);
    } finally {
      _$_MapsLojaEntregadorControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entregador: ${entregador},
localizacaoModel: ${localizacaoModel},
googleMapsController: ${googleMapsController},
mapStyle: ${mapStyle},
sourceIcon: ${sourceIcon},
destinationIcon: ${destinationIcon},
clienteLat: ${clienteLat},
clienteLng: ${clienteLng},
center: ${center},
markers: ${markers},
polylines: ${polylines},
polylinePoints: ${polylinePoints},
polylineCoordinates: ${polylineCoordinates},
pinos: ${pinos},
movimento: ${movimento},
localizacaoEntregador: ${localizacaoEntregador}
    ''';
  }
}
