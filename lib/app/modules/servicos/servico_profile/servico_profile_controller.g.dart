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

  final _$getServicoUserAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.getServicoUser');

  @override
  Future getServicoUser(int userId) {
    return _$getServicoUserAsyncAction.run(() => super.getServicoUser(userId));
  }

  final _$_ServicoProfileControllerBaseActionController =
      ActionController(name: '_ServicoProfileControllerBase');

  @override
  dynamic sendWhatsApp(String numero) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.sendWhatsApp');
    try {
      return super.sendWhatsApp(numero);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendInstagram(String user) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.sendInstagram');
    try {
      return super.sendInstagram(user);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendCall(String numero) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.sendCall');
    try {
      return super.sendCall(numero);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendEmail(String email) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.sendEmail');
    try {
      return super.sendEmail(email);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicoUser: ${servicoUser}
    ''';
  }
}
