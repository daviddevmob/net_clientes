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

  final _$getServicoAtom =
      Atom(name: '_ServicoProfileControllerBase.getServico');

  @override
  ObservableStream<ServicoFavoritoModelProfile> get getServico {
    _$getServicoAtom.reportRead();
    return super.getServico;
  }

  @override
  set getServico(ObservableStream<ServicoFavoritoModelProfile> value) {
    _$getServicoAtom.reportWrite(value, super.getServico, () {
      super.getServico = value;
    });
  }

  final _$setFavoritoAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.setFavorito');

  @override
  Future setFavorito(int lojaId, int clienteId, bool value) {
    return _$setFavoritoAsyncAction
        .run(() => super.setFavorito(lojaId, clienteId, value));
  }

  final _$salvarFavoritoAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.salvarFavorito');

  @override
  Future salvarFavorito(int lojaId, int clienteId) {
    return _$salvarFavoritoAsyncAction
        .run(() => super.salvarFavorito(lojaId, clienteId));
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

  final _$_ServicoProfileControllerBaseActionController =
      ActionController(name: '_ServicoProfileControllerBase');

  @override
  dynamic getServicoFavorito(int lojaId, int clienteId) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.getServicoFavorito');
    try {
      return super.getServicoFavorito(lojaId, clienteId);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicoUser: ${servicoUser},
getServico: ${getServico}
    ''';
  }
}
