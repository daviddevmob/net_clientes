// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsController on _MapsControllerBase, Store {
  final _$localizacaoModelAtom =
      Atom(name: '_MapsControllerBase.localizacaoModel');

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

  final _$enderecoControllerAtom =
      Atom(name: '_MapsControllerBase.enderecoController');

  @override
  TextEditingController get enderecoController {
    _$enderecoControllerAtom.reportRead();
    return super.enderecoController;
  }

  @override
  set enderecoController(TextEditingController value) {
    _$enderecoControllerAtom.reportWrite(value, super.enderecoController, () {
      super.enderecoController = value;
    });
  }

  final _$verBotaoSalvarAtom = Atom(name: '_MapsControllerBase.verBotaoSalvar');

  @override
  bool get verBotaoSalvar {
    _$verBotaoSalvarAtom.reportRead();
    return super.verBotaoSalvar;
  }

  @override
  set verBotaoSalvar(bool value) {
    _$verBotaoSalvarAtom.reportWrite(value, super.verBotaoSalvar, () {
      super.verBotaoSalvar = value;
    });
  }

  final _$localizacaoAtom = Atom(name: '_MapsControllerBase.localizacao');

  @override
  Localizacao get localizacao {
    _$localizacaoAtom.reportRead();
    return super.localizacao;
  }

  @override
  set localizacao(Localizacao value) {
    _$localizacaoAtom.reportWrite(value, super.localizacao, () {
      super.localizacao = value;
    });
  }

  final _$mapTypeAtom = Atom(name: '_MapsControllerBase.mapType');

  @override
  MapType get mapType {
    _$mapTypeAtom.reportRead();
    return super.mapType;
  }

  @override
  set mapType(MapType value) {
    _$mapTypeAtom.reportWrite(value, super.mapType, () {
      super.mapType = value;
    });
  }

  final _$googleMapsControllerAtom =
      Atom(name: '_MapsControllerBase.googleMapsController');

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

  final _$centerAtom = Atom(name: '_MapsControllerBase.center');

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

  final _$markersAtom = Atom(name: '_MapsControllerBase.markers');

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

  final _$pesquisarLocalizacaoAsyncAction =
      AsyncAction('_MapsControllerBase.pesquisarLocalizacao');

  @override
  Future pesquisarLocalizacao() {
    return _$pesquisarLocalizacaoAsyncAction
        .run(() => super.pesquisarLocalizacao());
  }

  final _$setLocalizacaoAtualAsyncAction =
      AsyncAction('_MapsControllerBase.setLocalizacaoAtual');

  @override
  Future setLocalizacaoAtual() {
    return _$setLocalizacaoAtualAsyncAction
        .run(() => super.setLocalizacaoAtual());
  }

  final _$setMapPositionAsyncAction =
      AsyncAction('_MapsControllerBase.setMapPosition');

  @override
  Future setMapPosition(dynamic titulo, dynamic snippet) {
    return _$setMapPositionAsyncAction
        .run(() => super.setMapPosition(titulo, snippet));
  }

  final _$searchLocalAsyncAction =
      AsyncAction('_MapsControllerBase.searchLocal');

  @override
  Future searchLocal(String endereco) {
    return _$searchLocalAsyncAction.run(() => super.searchLocal(endereco));
  }

  final _$deleteLocalizacaoMapsAsyncAction =
      AsyncAction('_MapsControllerBase.deleteLocalizacaoMaps');

  @override
  Future deleteLocalizacaoMaps(int localizacaoId) {
    return _$deleteLocalizacaoMapsAsyncAction
        .run(() => super.deleteLocalizacaoMaps(localizacaoId));
  }

  final _$salvarLocalizacaoAsyncAction =
      AsyncAction('_MapsControllerBase.salvarLocalizacao');

  @override
  Future salvarLocalizacao(int localizacaoId) {
    return _$salvarLocalizacaoAsyncAction
        .run(() => super.salvarLocalizacao(localizacaoId));
  }

  final _$_MapsControllerBaseActionController =
      ActionController(name: '_MapsControllerBase');

  @override
  dynamic criarMapa(GoogleMapController controller) {
    final _$actionInfo = _$_MapsControllerBaseActionController.startAction(
        name: '_MapsControllerBase.criarMapa');
    try {
      return super.criarMapa(controller);
    } finally {
      _$_MapsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tirarMostrarPesquisa() {
    final _$actionInfo = _$_MapsControllerBaseActionController.startAction(
        name: '_MapsControllerBase.tirarMostrarPesquisa');
    try {
      return super.tirarMostrarPesquisa();
    } finally {
      _$_MapsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
localizacaoModel: ${localizacaoModel},
enderecoController: ${enderecoController},
verBotaoSalvar: ${verBotaoSalvar},
localizacao: ${localizacao},
mapType: ${mapType},
googleMapsController: ${googleMapsController},
center: ${center},
markers: ${markers}
    ''';
  }
}
