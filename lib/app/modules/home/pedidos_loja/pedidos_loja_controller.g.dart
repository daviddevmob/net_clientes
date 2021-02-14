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

  final _$editAvaliacaoAtom =
      Atom(name: '_PedidosLojaControllerBase.editAvaliacao');

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
      Atom(name: '_PedidosLojaControllerBase.novaAvaliacao');

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
      Atom(name: '_PedidosLojaControllerBase.editarTextAvaliacao');

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
      Atom(name: '_PedidosLojaControllerBase.novaTextAvaliacao');

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
      AsyncAction('_PedidosLojaControllerBase.setEditAvaliacao');

  @override
  Future setEditAvaliacao(
      int clienteId, int restId, int pedidoId, int avaliacaoId) {
    return _$setEditAvaliacaoAsyncAction.run(
        () => super.setEditAvaliacao(clienteId, restId, pedidoId, avaliacaoId));
  }

  final _$addAvaliacaoAsyncAction =
      AsyncAction('_PedidosLojaControllerBase.addAvaliacao');

  @override
  Future addAvaliacao(int clienteId, int lojaId, int pedidoId) {
    return _$addAvaliacaoAsyncAction
        .run(() => super.addAvaliacao(clienteId, lojaId, pedidoId));
  }

  final _$_PedidosLojaControllerBaseActionController =
      ActionController(name: '_PedidosLojaControllerBase');

  @override
  dynamic setEditNota(double newValue) {
    final _$actionInfo = _$_PedidosLojaControllerBaseActionController
        .startAction(name: '_PedidosLojaControllerBase.setEditNota');
    try {
      return super.setEditNota(newValue);
    } finally {
      _$_PedidosLojaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNovaNota(double newvalue) {
    final _$actionInfo = _$_PedidosLojaControllerBaseActionController
        .startAction(name: '_PedidosLojaControllerBase.setNovaNota');
    try {
      return super.setNovaNota(newvalue);
    } finally {
      _$_PedidosLojaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
pedidos: ${pedidos},
editAvaliacao: ${editAvaliacao},
novaAvaliacao: ${novaAvaliacao},
editarTextAvaliacao: ${editarTextAvaliacao},
novaTextAvaliacao: ${novaTextAvaliacao}
    ''';
  }
}
