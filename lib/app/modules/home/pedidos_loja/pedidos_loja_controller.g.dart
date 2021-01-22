// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_loja_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidosLojaController on _PedidosLojaControllerBase, Store {
  final _$pedidosAtom = Atom(name: '_PedidosLojaControllerBase.pedidos');

  @override
  ObservableStream<PedidosLojaModel> get pedidos {
    _$pedidosAtom.reportRead();
    return super.pedidos;
  }

  @override
  set pedidos(ObservableStream<PedidosLojaModel> value) {
    _$pedidosAtom.reportWrite(value, super.pedidos, () {
      super.pedidos = value;
    });
  }

  final _$_PedidosLojaControllerBaseActionController =
      ActionController(name: '_PedidosLojaControllerBase');

  @override
  dynamic getPedidosLojaUser(int clienteId) {
    final _$actionInfo = _$_PedidosLojaControllerBaseActionController
        .startAction(name: '_PedidosLojaControllerBase.getPedidosLojaUser');
    try {
      return super.getPedidosLojaUser(clienteId);
    } finally {
      _$_PedidosLojaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pedidos: ${pedidos}
    ''';
  }
}
