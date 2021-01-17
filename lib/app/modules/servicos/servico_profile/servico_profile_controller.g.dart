// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicoProfileController on _ServicoProfileControllerBase, Store {
  final _$servicoUserAtom =
      Atom(name: '_ServicoProfileControllerBase.servicoUser');

  @override
  ServicoModel get servicoUser {
    _$servicoUserAtom.reportRead();
    return super.servicoUser;
  }

  @override
  set servicoUser(ServicoModel value) {
    _$servicoUserAtom.reportWrite(value, super.servicoUser, () {
      super.servicoUser = value;
    });
  }

  final _$sendWhatsAppAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.sendWhatsApp');

  @override
  Future sendWhatsApp(String numero) {
    return _$sendWhatsAppAsyncAction.run(() => super.sendWhatsApp(numero));
  }

  final _$sendInstagramAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.sendInstagram');

  @override
  Future sendInstagram(String user) {
    return _$sendInstagramAsyncAction.run(() => super.sendInstagram(user));
  }

  final _$sendCallAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.sendCall');

  @override
  Future sendCall(String numero) {
    return _$sendCallAsyncAction.run(() => super.sendCall(numero));
  }

  final _$sendEmailAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.sendEmail');

  @override
  Future sendEmail(String email) {
    return _$sendEmailAsyncAction.run(() => super.sendEmail(email));
  }

  final _$getServicoUserAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.getServicoUser');

  @override
  Future getServicoUser(int userId) {
    return _$getServicoUserAsyncAction.run(() => super.getServicoUser(userId));
  }

  @override
  String toString() {
    return '''
servicoUser: ${servicoUser}
    ''';
  }
}
