// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritos_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritosRestController on _FavoritosRestControllerBase, Store {
  final _$listAtom = Atom(name: '_FavoritosRestControllerBase.list');

  @override
  ObservableStream<RestFavoritoModelList> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableStream<RestFavoritoModelList> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_FavoritosRestControllerBaseActionController =
      ActionController(name: '_FavoritosRestControllerBase');

  @override
  dynamic getRestFavoritos(int clienteId) {
    final _$actionInfo = _$_FavoritosRestControllerBaseActionController
        .startAction(name: '_FavoritosRestControllerBase.getRestFavoritos');
    try {
      return super.getRestFavoritos(clienteId);
    } finally {
      _$_FavoritosRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
