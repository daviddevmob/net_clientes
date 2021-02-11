// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_entregador_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsEntregadorController on _MapsEntregadorControllerBase, Store {
  final _$entregadorAtom =
      Atom(name: '_MapsEntregadorControllerBase.entregador');

  @override
  ObservableStream<EntregadorLocalizacaoModel> get entregador {
    _$entregadorAtom.reportRead();
    return super.entregador;
  }

  @override
  set entregador(ObservableStream<EntregadorLocalizacaoModel> value) {
    _$entregadorAtom.reportWrite(value, super.entregador, () {
      super.entregador = value;
    });
  }

  final _$localizacaoModelAtom =
      Atom(name: '_MapsEntregadorControllerBase.localizacaoModel');

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
      Atom(name: '_MapsEntregadorControllerBase.googleMapsController');

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

  final _$mapStyleAtom = Atom(name: '_MapsEntregadorControllerBase.mapStyle');

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

  final _$clienteLatAtom =
      Atom(name: '_MapsEntregadorControllerBase.clienteLat');

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
      Atom(name: '_MapsEntregadorControllerBase.clienteLng');

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

  final _$centerAtom = Atom(name: '_MapsEntregadorControllerBase.center');

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

  final _$markersAtom = Atom(name: '_MapsEntregadorControllerBase.markers');

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

  final _$setLocalizacaoAtualAsyncAction =
      AsyncAction('_MapsEntregadorControllerBase.setLocalizacaoAtual');

  @override
  Future setLocalizacaoAtual() {
    return _$setLocalizacaoAtualAsyncAction
        .run(() => super.setLocalizacaoAtual());
  }

  final _$setMapPositionAsyncAction =
      AsyncAction('_MapsEntregadorControllerBase.setMapPosition');

  @override
  Future setMapPosition(dynamic titulo, dynamic snippet) {
    return _$setMapPositionAsyncAction
        .run(() => super.setMapPosition(titulo, snippet));
  }

  final _$_MapsEntregadorControllerBaseActionController =
      ActionController(name: '_MapsEntregadorControllerBase');

  @override
  dynamic criarMapa(GoogleMapController controller) {
    final _$actionInfo = _$_MapsEntregadorControllerBaseActionController
        .startAction(name: '_MapsEntregadorControllerBase.criarMapa');
    try {
      return super.criarMapa(controller);
    } finally {
      _$_MapsEntregadorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getLocalizacao(int entregadorId, int pedidoId) {
    final _$actionInfo = _$_MapsEntregadorControllerBaseActionController
        .startAction(name: '_MapsEntregadorControllerBase.getLocalizacao');
    try {
      return super.getLocalizacao(entregadorId, pedidoId);
    } finally {
      _$_MapsEntregadorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entregador: ${entregador},
localizacaoModel: ${localizacaoModel},
googleMapsController: ${googleMapsController},
mapStyle: ${mapStyle},
clienteLat: ${clienteLat},
clienteLng: ${clienteLng},
center: ${center},
markers: ${markers}
    ''';
  }
}
