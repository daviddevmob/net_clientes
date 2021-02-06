// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidosRestController on _PedidosRestControllerBase, Store {
  final _$pedidosAtom = Atom(name: '_PedidosRestControllerBase.pedidos');

  @override
  ObservableStream<PedidosRestModel> get pedidos {
    _$pedidosAtom.reportRead();
    return super.pedidos;
  }

  @override
  set pedidos(ObservableStream<PedidosRestModel> value) {
    _$pedidosAtom.reportWrite(value, super.pedidos, () {
      super.pedidos = value;
    });
  }

  final _$_PedidosRestControllerBaseActionController =
      ActionController(name: '_PedidosRestControllerBase');

  @override
  dynamic getPedidos(int clienteId) {
    final _$actionInfo = _$_PedidosRestControllerBaseActionController
        .startAction(name: '_PedidosRestControllerBase.getPedidos');
    try {
      return super.getPedidos(clienteId);
    } finally {
      _$_PedidosRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pedidos: ${pedidos}
    ''';
  }
}
