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

  final _$sendWhatsAppAsyncAction =
      AsyncAction('_OngProfileControllerBase.sendWhatsApp');

  @override
  Future sendWhatsApp(String numero) {
    return _$sendWhatsAppAsyncAction.run(() => super.sendWhatsApp(numero));
  }

  final _$sendInstagramAsyncAction =
      AsyncAction('_OngProfileControllerBase.sendInstagram');

  @override
  Future sendInstagram(String user) {
    return _$sendInstagramAsyncAction.run(() => super.sendInstagram(user));
  }

  final _$sendLigacaoAsyncAction =
      AsyncAction('_OngProfileControllerBase.sendLigacao');

  @override
  Future sendLigacao(String numero) {
    return _$sendLigacaoAsyncAction.run(() => super.sendLigacao(numero));
  }

  final _$sendEmailAsyncAction =
      AsyncAction('_OngProfileControllerBase.sendEmail');

  @override
  Future sendEmail(String email) {
    return _$sendEmailAsyncAction.run(() => super.sendEmail(email));
  }

  @override
  String toString() {
    return '''
ong: ${ong}
    ''';
  }
}
