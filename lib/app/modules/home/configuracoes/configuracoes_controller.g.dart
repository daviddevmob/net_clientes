// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracoesController on _ConfiguracoesControllerBase, Store {
  final _$imageProfileAtom =
      Atom(name: '_ConfiguracoesControllerBase.imageProfile');

  @override
  File get imageProfile {
    _$imageProfileAtom.reportRead();
    return super.imageProfile;
  }

  @override
  set imageProfile(File value) {
    _$imageProfileAtom.reportWrite(value, super.imageProfile, () {
      super.imageProfile = value;
    });
  }

  final _$clienteAtom = Atom(name: '_ConfiguracoesControllerBase.cliente');

  @override
  ObservableStream<ClienteModel> get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ObservableStream<ClienteModel> value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$testeImagemAtom =
      Atom(name: '_ConfiguracoesControllerBase.testeImagem');

  @override
  bool get testeImagem {
    _$testeImagemAtom.reportRead();
    return super.testeImagem;
  }

  @override
  set testeImagem(bool value) {
    _$testeImagemAtom.reportWrite(value, super.testeImagem, () {
      super.testeImagem = value;
    });
  }

  final _$clienteIdAtom = Atom(name: '_ConfiguracoesControllerBase.clienteId');

  @override
  int get clienteId {
    _$clienteIdAtom.reportRead();
    return super.clienteId;
  }

  @override
  set clienteId(int value) {
    _$clienteIdAtom.reportWrite(value, super.clienteId, () {
      super.clienteId = value;
    });
  }

  final _$getClienteAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.getCliente');

  @override
  Future getCliente(String email) {
    return _$getClienteAsyncAction.run(() => super.getCliente(email));
  }

  final _$updateImageProfileAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.updateImageProfile');

  @override
  Future updateImageProfile() {
    return _$updateImageProfileAsyncAction
        .run(() => super.updateImageProfile());
  }

  final _$saveImageProfileAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.saveImageProfile');

  @override
  Future saveImageProfile(File imageProfile, int clienteId) {
    return _$saveImageProfileAsyncAction
        .run(() => super.saveImageProfile(imageProfile, clienteId));
  }

  final _$sairContaAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.sairConta');

  @override
  Future sairConta() {
    return _$sairContaAsyncAction.run(() => super.sairConta());
  }

  @override
  String toString() {
    return '''
imageProfile: ${imageProfile},
cliente: ${cliente},
testeImagem: ${testeImagem},
clienteId: ${clienteId}
    ''';
  }
}
