// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ong_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OngProfileController on _OngProfileControllerBase, Store {
  final _$ongAtom = Atom(name: '_OngProfileControllerBase.ong');

  @override
  OngModel get ong {
    _$ongAtom.reportRead();
    return super.ong;
  }

  @override
  set ong(OngModel value) {
    _$ongAtom.reportWrite(value, super.ong, () {
      super.ong = value;
    });
  }

  final _$getOngAsyncAction = AsyncAction('_OngProfileControllerBase.getOng');

  @override
  Future getOng(int userId) {
    return _$getOngAsyncAction.run(() => super.getOng(userId));
  }

  @override
  String toString() {
    return '''
ong: ${ong}
    ''';
  }
}
