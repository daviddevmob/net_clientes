// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OngsController on _OngsControllerBase, Store {
  final _$ongAtom = Atom(name: '_OngsControllerBase.ong');

  @override
  OngSearchModel get ong {
    _$ongAtom.reportRead();
    return super.ong;
  }

  @override
  set ong(OngSearchModel value) {
    _$ongAtom.reportWrite(value, super.ong, () {
      super.ong = value;
    });
  }

  final _$bairroAtom = Atom(name: '_OngsControllerBase.bairro');

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

  final _$getOngAsyncAction = AsyncAction('_OngsControllerBase.getOng');

  @override
  Future getOng() {
    return _$getOngAsyncAction.run(() => super.getOng());
  }

  final _$getOngBairroAsyncAction =
      AsyncAction('_OngsControllerBase.getOngBairro');

  @override
  Future getOngBairro(int bairro) {
    return _$getOngBairroAsyncAction.run(() => super.getOngBairro(bairro));
  }

  final _$_OngsControllerBaseActionController =
      ActionController(name: '_OngsControllerBase');

  @override
  dynamic setBairro(int newValue) {
    final _$actionInfo = _$_OngsControllerBaseActionController.startAction(
        name: '_OngsControllerBase.setBairro');
    try {
      return super.setBairro(newValue);
    } finally {
      _$_OngsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ong: ${ong},
bairro: ${bairro}
    ''';
  }
}
