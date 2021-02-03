// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantesController on _RestaurantesControllerBase, Store {
  final _$restsAtom = Atom(name: '_RestaurantesControllerBase.rests');

  @override
  RestListModel get rests {
    _$restsAtom.reportRead();
    return super.rests;
  }

  @override
  set rests(RestListModel value) {
    _$restsAtom.reportWrite(value, super.rests, () {
      super.rests = value;
    });
  }

  final _$domicilioAtom = Atom(name: '_RestaurantesControllerBase.domicilio');

  @override
  bool get domicilio {
    _$domicilioAtom.reportRead();
    return super.domicilio;
  }

  @override
  set domicilio(bool value) {
    _$domicilioAtom.reportWrite(value, super.domicilio, () {
      super.domicilio = value;
    });
  }

  final _$lojaFisicaAtom = Atom(name: '_RestaurantesControllerBase.lojaFisica');

  @override
  bool get lojaFisica {
    _$lojaFisicaAtom.reportRead();
    return super.lojaFisica;
  }

  @override
  set lojaFisica(bool value) {
    _$lojaFisicaAtom.reportWrite(value, super.lojaFisica, () {
      super.lojaFisica = value;
    });
  }

  final _$bairroAtom = Atom(name: '_RestaurantesControllerBase.bairro');

  @override
  int get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(int value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_RestaurantesControllerBase.categoria');

  @override
  int get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(int value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$textSearchAtom = Atom(name: '_RestaurantesControllerBase.textSearch');

  @override
  TextEditingController get textSearch {
    _$textSearchAtom.reportRead();
    return super.textSearch;
  }

  @override
  set textSearch(TextEditingController value) {
    _$textSearchAtom.reportWrite(value, super.textSearch, () {
      super.textSearch = value;
    });
  }

  final _$getListRestsAsyncAction =
      AsyncAction('_RestaurantesControllerBase.getListRests');

  @override
  Future getListRests() {
    return _$getListRestsAsyncAction.run(() => super.getListRests());
  }

  final _$_RestaurantesControllerBaseActionController =
      ActionController(name: '_RestaurantesControllerBase');

  @override
  dynamic getBairro(int newValue) {
    final _$actionInfo = _$_RestaurantesControllerBaseActionController
        .startAction(name: '_RestaurantesControllerBase.getBairro');
    try {
      return super.getBairro(newValue);
    } finally {
      _$_RestaurantesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDistanciaNegocio(
      double userLat, double userLong, double lat, double lng) {
    final _$actionInfo = _$_RestaurantesControllerBaseActionController
        .startAction(name: '_RestaurantesControllerBase.getDistanciaNegocio');
    try {
      return super.getDistanciaNegocio(userLat, userLong, lat, lng);
    } finally {
      _$_RestaurantesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategoriaRests(int newValue) {
    final _$actionInfo = _$_RestaurantesControllerBaseActionController
        .startAction(name: '_RestaurantesControllerBase.setCategoriaRests');
    try {
      return super.setCategoriaRests(newValue);
    } finally {
      _$_RestaurantesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rests: ${rests},
domicilio: ${domicilio},
lojaFisica: ${lojaFisica},
bairro: ${bairro},
categoria: ${categoria},
textSearch: ${textSearch}
    ''';
  }
}
