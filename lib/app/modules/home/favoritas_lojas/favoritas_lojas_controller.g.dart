// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritas_lojas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritasLojasController on _FavoritasLojasControllerBase, Store {
  final _$listAtom = Atom(name: '_FavoritasLojasControllerBase.list');

  @override
  LojaFavotiraModel get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(LojaFavotiraModel value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getLojasAsyncAction =
      AsyncAction('_FavoritasLojasControllerBase.getLojas');

  @override
  Future getLojas(int clienteId) {
    return _$getLojasAsyncAction.run(() => super.getLojas(clienteId));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
