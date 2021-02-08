// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favotiros_ongs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavotirosOngsController on _FavotirosOngsControllerBase, Store {
  final _$ongsAtom = Atom(name: '_FavotirosOngsControllerBase.ongs');

  @override
  OngsFaviritasModel get ongs {
    _$ongsAtom.reportRead();
    return super.ongs;
  }

  @override
  set ongs(OngsFaviritasModel value) {
    _$ongsAtom.reportWrite(value, super.ongs, () {
      super.ongs = value;
    });
  }

  final _$getOnsAsyncAction =
      AsyncAction('_FavotirosOngsControllerBase.getOns');

  @override
  Future getOns(int clienteId) {
    return _$getOnsAsyncAction.run(() => super.getOns(clienteId));
  }

  @override
  String toString() {
    return '''
ongs: ${ongs}
    ''';
  }
}
