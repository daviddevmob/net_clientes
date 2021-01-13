// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$clienteAtom = Atom(name: '_HomeControllerBase.cliente');

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

  final _$sendInstagramAsyncAction =
      AsyncAction('_HomeControllerBase.sendInstagram');

  @override
  Future sendInstagram() {
    return _$sendInstagramAsyncAction.run(() => super.sendInstagram());
  }

  final _$getClienteAsyncAction = AsyncAction('_HomeControllerBase.getCliente');

  @override
  Future getCliente(String email) {
    return _$getClienteAsyncAction.run(() => super.getCliente(email));
  }

  @override
  String toString() {
    return '''
cliente: ${cliente}
    ''';
  }
}
