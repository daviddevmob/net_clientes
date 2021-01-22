// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enderecos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecosController on _EnderecosControllerBase, Store {
  final _$clienteEnderecosAtom =
      Atom(name: '_EnderecosControllerBase.clienteEnderecos');

  @override
  ObservableStream<List<EnderecoClienteModel>> get clienteEnderecos {
    _$clienteEnderecosAtom.reportRead();
    return super.clienteEnderecos;
  }

  @override
  set clienteEnderecos(ObservableStream<List<EnderecoClienteModel>> value) {
    _$clienteEnderecosAtom.reportWrite(value, super.clienteEnderecos, () {
      super.clienteEnderecos = value;
    });
  }

  final _$controllerAtom = Atom(name: '_EnderecosControllerBase.controller');

  @override
  HomeController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(HomeController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$deleteLocalizacaoAsyncAction =
      AsyncAction('_EnderecosControllerBase.deleteLocalizacao');

  @override
  Future deleteLocalizacao(int enderecoId) {
    return _$deleteLocalizacaoAsyncAction
        .run(() => super.deleteLocalizacao(enderecoId));
  }

  final _$updateEnderecoPrincipalAsyncAction =
      AsyncAction('_EnderecosControllerBase.updateEnderecoPrincipal');

  @override
  Future updateEnderecoPrincipal(int clienteId, int enderecoId) {
    return _$updateEnderecoPrincipalAsyncAction
        .run(() => super.updateEnderecoPrincipal(clienteId, enderecoId));
  }

  final _$_EnderecosControllerBaseActionController =
      ActionController(name: '_EnderecosControllerBase');

  @override
  dynamic getClienteEnderecos(int clienteId) {
    final _$actionInfo = _$_EnderecosControllerBaseActionController.startAction(
        name: '_EnderecosControllerBase.getClienteEnderecos');
    try {
      return super.getClienteEnderecos(clienteId);
    } finally {
      _$_EnderecosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clienteEnderecos: ${clienteEnderecos},
controller: ${controller}
    ''';
  }
}
