// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lojas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojasController on _LojasControllerBase, Store {
  final _$listLojasAtom = Atom(name: '_LojasControllerBase.listLojas');

  @override
  ListLojasModel get listLojas {
    _$listLojasAtom.reportRead();
    return super.listLojas;
  }

  @override
  set listLojas(ListLojasModel value) {
    _$listLojasAtom.reportWrite(value, super.listLojas, () {
      super.listLojas = value;
    });
  }

  final _$domicilioAtom = Atom(name: '_LojasControllerBase.domicilio');

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

  final _$lojaFisicaAtom = Atom(name: '_LojasControllerBase.lojaFisica');

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

  final _$bairroAtom = Atom(name: '_LojasControllerBase.bairro');

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

  final _$categoriaAtom = Atom(name: '_LojasControllerBase.categoria');

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

  final _$textSearchAtom = Atom(name: '_LojasControllerBase.textSearch');

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

  final _$getListLojasAsyncAction =
      AsyncAction('_LojasControllerBase.getListLojas');

  @override
  Future getListLojas() {
    return _$getListLojasAsyncAction.run(() => super.getListLojas());
  }

  final _$_LojasControllerBaseActionController =
      ActionController(name: '_LojasControllerBase');

  @override
  dynamic getBairro(int newValue) {
    final _$actionInfo = _$_LojasControllerBaseActionController.startAction(
        name: '_LojasControllerBase.getBairro');
    try {
      return super.getBairro(newValue);
    } finally {
      _$_LojasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDistanciaNegocio(
      double userLat, double userLong, double lat, double lng) {
    final _$actionInfo = _$_LojasControllerBaseActionController.startAction(
        name: '_LojasControllerBase.getDistanciaNegocio');
    try {
      return super.getDistanciaNegocio(userLat, userLong, lat, lng);
    } finally {
      _$_LojasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategoriaLojas(int newValue) {
    final _$actionInfo = _$_LojasControllerBaseActionController.startAction(
        name: '_LojasControllerBase.setCategoriaLojas');
    try {
      return super.setCategoriaLojas(newValue);
    } finally {
      _$_LojasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listLojas: ${listLojas},
domicilio: ${domicilio},
lojaFisica: ${lojaFisica},
bairro: ${bairro},
categoria: ${categoria},
textSearch: ${textSearch}
    ''';
  }
}
