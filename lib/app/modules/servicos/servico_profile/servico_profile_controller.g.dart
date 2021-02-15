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

  final _$avaliacaoProfileAtom =
      Atom(name: '_ServicoProfileControllerBase.avaliacaoProfile');

  @override
  ObservableStream<ServicoAvaliacaoProfile> get avaliacaoProfile {
    _$avaliacaoProfileAtom.reportRead();
    return super.avaliacaoProfile;
  }

  @override
  set avaliacaoProfile(ObservableStream<ServicoAvaliacaoProfile> value) {
    _$avaliacaoProfileAtom.reportWrite(value, super.avaliacaoProfile, () {
      super.avaliacaoProfile = value;
    });
  }

  final _$editAvaliacaoAtom =
      Atom(name: '_ServicoProfileControllerBase.editAvaliacao');

  @override
  double get editAvaliacao {
    _$editAvaliacaoAtom.reportRead();
    return super.editAvaliacao;
  }

  @override
  set editAvaliacao(double value) {
    _$editAvaliacaoAtom.reportWrite(value, super.editAvaliacao, () {
      super.editAvaliacao = value;
    });
  }

  final _$novaAvaliacaoAtom =
      Atom(name: '_ServicoProfileControllerBase.novaAvaliacao');

  @override
  double get novaAvaliacao {
    _$novaAvaliacaoAtom.reportRead();
    return super.novaAvaliacao;
  }

  @override
  set novaAvaliacao(double value) {
    _$novaAvaliacaoAtom.reportWrite(value, super.novaAvaliacao, () {
      super.novaAvaliacao = value;
    });
  }

  final _$editarTextAvaliacaoAtom =
      Atom(name: '_ServicoProfileControllerBase.editarTextAvaliacao');

  @override
  TextEditingController get editarTextAvaliacao {
    _$editarTextAvaliacaoAtom.reportRead();
    return super.editarTextAvaliacao;
  }

  @override
  set editarTextAvaliacao(TextEditingController value) {
    _$editarTextAvaliacaoAtom.reportWrite(value, super.editarTextAvaliacao, () {
      super.editarTextAvaliacao = value;
    });
  }

  final _$novaTextAvaliacaoAtom =
      Atom(name: '_ServicoProfileControllerBase.novaTextAvaliacao');

  @override
  TextEditingController get novaTextAvaliacao {
    _$novaTextAvaliacaoAtom.reportRead();
    return super.novaTextAvaliacao;
  }

  @override
  set novaTextAvaliacao(TextEditingController value) {
    _$novaTextAvaliacaoAtom.reportWrite(value, super.novaTextAvaliacao, () {
      super.novaTextAvaliacao = value;
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

  final _$setEditAvaliacaoAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.setEditAvaliacao');

  @override
  Future setEditAvaliacao(int avaliacaoId) {
    return _$setEditAvaliacaoAsyncAction
        .run(() => super.setEditAvaliacao(avaliacaoId));
  }

  final _$addAvaliacaoAsyncAction =
      AsyncAction('_ServicoProfileControllerBase.addAvaliacao');

  @override
  Future addAvaliacao(int clienteId, int servicoId) {
    return _$addAvaliacaoAsyncAction
        .run(() => super.addAvaliacao(clienteId, servicoId));
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
  dynamic setEditValue(double newValue) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.setEditValue');
    try {
      return super.setEditValue(newValue);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNotaNova(double newValue) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.setNotaNova');
    try {
      return super.setNotaNova(newValue);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAvalicaoProfile(int clienteId, int servicoId) {
    final _$actionInfo = _$_ServicoProfileControllerBaseActionController
        .startAction(name: '_ServicoProfileControllerBase.getAvalicaoProfile');
    try {
      return super.getAvalicaoProfile(clienteId, servicoId);
    } finally {
      _$_ServicoProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
avaliacaoProfile: ${avaliacaoProfile},
editAvaliacao: ${editAvaliacao},
novaAvaliacao: ${novaAvaliacao},
editarTextAvaliacao: ${editarTextAvaliacao},
novaTextAvaliacao: ${novaTextAvaliacao},
getServico: ${getServico}
    ''';
  }
}
