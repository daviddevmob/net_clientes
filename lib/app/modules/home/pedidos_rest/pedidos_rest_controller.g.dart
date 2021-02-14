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

  final _$editAvaliacaoAtom =
      Atom(name: '_PedidosRestControllerBase.editAvaliacao');

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

  final _$editarTextAvaliacaoAtom =
      Atom(name: '_PedidosRestControllerBase.editarTextAvaliacao');

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

  final _$novaAvaliacaoAtom =
      Atom(name: '_PedidosRestControllerBase.novaAvaliacao');

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

  final _$novaTextAvaliacaoAtom =
      Atom(name: '_PedidosRestControllerBase.novaTextAvaliacao');

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

  final _$setEditAvaliacaoAsyncAction =
      AsyncAction('_PedidosRestControllerBase.setEditAvaliacao');

  @override
  Future setEditAvaliacao(
      int clienteId, int restId, int pedidoId, int avaliacaoId) {
    return _$setEditAvaliacaoAsyncAction.run(
        () => super.setEditAvaliacao(clienteId, restId, pedidoId, avaliacaoId));
  }

  final _$addAvalicaoAsyncAction =
      AsyncAction('_PedidosRestControllerBase.addAvalicao');

  @override
  Future addAvalicao(int clienteId, int restId, int pedidoId) {
    return _$addAvalicaoAsyncAction
        .run(() => super.addAvalicao(clienteId, restId, pedidoId));
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
  dynamic setEditNota(double newValue) {
    final _$actionInfo = _$_PedidosRestControllerBaseActionController
        .startAction(name: '_PedidosRestControllerBase.setEditNota');
    try {
      return super.setEditNota(newValue);
    } finally {
      _$_PedidosRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNovaNota(double newValue) {
    final _$actionInfo = _$_PedidosRestControllerBaseActionController
        .startAction(name: '_PedidosRestControllerBase.setNovaNota');
    try {
      return super.setNovaNota(newValue);
    } finally {
      _$_PedidosRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pedidos: ${pedidos},
editAvaliacao: ${editAvaliacao},
editarTextAvaliacao: ${editarTextAvaliacao},
novaAvaliacao: ${novaAvaliacao},
novaTextAvaliacao: ${novaTextAvaliacao}
    ''';
  }
}
