// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoRestController on _CarrinhoRestControllerBase, Store {
  Computed<double> _$totalPedidoComputed;

  @override
  double get totalPedido =>
      (_$totalPedidoComputed ??= Computed<double>(() => super.totalPedido,
              name: '_CarrinhoRestControllerBase.totalPedido'))
          .value;
  Computed<bool> _$liberarPedirComputed;

  @override
  bool get liberarPedir =>
      (_$liberarPedirComputed ??= Computed<bool>(() => super.liberarPedir,
              name: '_CarrinhoRestControllerBase.liberarPedir'))
          .value;
  Computed<List<ItemPedidoRestModel>> _$itensComputed;

  @override
  List<ItemPedidoRestModel> get itens => (_$itensComputed ??=
          Computed<List<ItemPedidoRestModel>>(() => super.itens,
              name: '_CarrinhoRestControllerBase.itens'))
      .value;
  Computed<List<ItemPedidoRestModel>> _$todosItensComputed;

  @override
  List<ItemPedidoRestModel> get todosItens => (_$todosItensComputed ??=
          Computed<List<ItemPedidoRestModel>>(() => super.todosItens,
              name: '_CarrinhoRestControllerBase.todosItens'))
      .value;
  Computed<List<ItemPedidoRestModel>> _$itemComputed;

  @override
  List<ItemPedidoRestModel> get item =>
      (_$itemComputed ??= Computed<List<ItemPedidoRestModel>>(() => super.item,
              name: '_CarrinhoRestControllerBase.item'))
          .value;

  final _$formKeyAtom = Atom(name: '_CarrinhoRestControllerBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$salvoAtom = Atom(name: '_CarrinhoRestControllerBase.salvo');

  @override
  bool get salvo {
    _$salvoAtom.reportRead();
    return super.salvo;
  }

  @override
  set salvo(bool value) {
    _$salvoAtom.reportWrite(value, super.salvo, () {
      super.salvo = value;
    });
  }

  final _$salvandoAtom = Atom(name: '_CarrinhoRestControllerBase.salvando');

  @override
  bool get salvando {
    _$salvandoAtom.reportRead();
    return super.salvando;
  }

  @override
  set salvando(bool value) {
    _$salvandoAtom.reportWrite(value, super.salvando, () {
      super.salvando = value;
    });
  }

  final _$metodoPagamentoCartaoIdAtom =
      Atom(name: '_CarrinhoRestControllerBase.metodoPagamentoCartaoId');

  @override
  int get metodoPagamentoCartaoId {
    _$metodoPagamentoCartaoIdAtom.reportRead();
    return super.metodoPagamentoCartaoId;
  }

  @override
  set metodoPagamentoCartaoId(int value) {
    _$metodoPagamentoCartaoIdAtom
        .reportWrite(value, super.metodoPagamentoCartaoId, () {
      super.metodoPagamentoCartaoId = value;
    });
  }

  final _$tipoEntregaAtom =
      Atom(name: '_CarrinhoRestControllerBase.tipoEntrega');

  @override
  bool get tipoEntrega {
    _$tipoEntregaAtom.reportRead();
    return super.tipoEntrega;
  }

  @override
  set tipoEntrega(bool value) {
    _$tipoEntregaAtom.reportWrite(value, super.tipoEntrega, () {
      super.tipoEntrega = value;
    });
  }

  final _$taxaEntregaAtom =
      Atom(name: '_CarrinhoRestControllerBase.taxaEntrega');

  @override
  double get taxaEntrega {
    _$taxaEntregaAtom.reportRead();
    return super.taxaEntrega;
  }

  @override
  set taxaEntrega(double value) {
    _$taxaEntregaAtom.reportWrite(value, super.taxaEntrega, () {
      super.taxaEntrega = value;
    });
  }

  final _$clienteIdAtom = Atom(name: '_CarrinhoRestControllerBase.clienteId');

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

  final _$pagamentoDinheiroAtom =
      Atom(name: '_CarrinhoRestControllerBase.pagamentoDinheiro');

  @override
  bool get pagamentoDinheiro {
    _$pagamentoDinheiroAtom.reportRead();
    return super.pagamentoDinheiro;
  }

  @override
  set pagamentoDinheiro(bool value) {
    _$pagamentoDinheiroAtom.reportWrite(value, super.pagamentoDinheiro, () {
      super.pagamentoDinheiro = value;
    });
  }

  final _$produtosAtom = Atom(name: '_CarrinhoRestControllerBase.produtos');

  @override
  ObservableList<ItemCarrinhoRestModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ItemCarrinhoRestModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$trocoParaControllerAtom =
      Atom(name: '_CarrinhoRestControllerBase.trocoParaController');

  @override
  TextEditingController get trocoParaController {
    _$trocoParaControllerAtom.reportRead();
    return super.trocoParaController;
  }

  @override
  set trocoParaController(TextEditingController value) {
    _$trocoParaControllerAtom.reportWrite(value, super.trocoParaController, () {
      super.trocoParaController = value;
    });
  }

  final _$getProdutosAsyncAction =
      AsyncAction('_CarrinhoRestControllerBase.getProdutos');

  @override
  Future getProdutos() {
    return _$getProdutosAsyncAction.run(() => super.getProdutos());
  }

  final _$deleteProdutoAsyncAction =
      AsyncAction('_CarrinhoRestControllerBase.deleteProduto');

  @override
  Future deleteProduto(ItemCarrinhoRestModel item) {
    return _$deleteProdutoAsyncAction.run(() => super.deleteProduto(item));
  }

  final _$printItensAsyncAction =
      AsyncAction('_CarrinhoRestControllerBase.printItens');

  @override
  Future printItens() {
    return _$printItensAsyncAction.run(() => super.printItens());
  }

  final _$fazerPedidoAsyncAction =
      AsyncAction('_CarrinhoRestControllerBase.fazerPedido');

  @override
  Future fazerPedido(int clienteId, int restId, int bairro,
      String clienteFirebaseId, String endereco, String localizacao) {
    return _$fazerPedidoAsyncAction.run(() => super.fazerPedido(
        clienteId, restId, bairro, clienteFirebaseId, endereco, localizacao));
  }

  final _$_CarrinhoRestControllerBaseActionController =
      ActionController(name: '_CarrinhoRestControllerBase');

  @override
  dynamic setMetodoPagamentoCartaoId(int value) {
    final _$actionInfo =
        _$_CarrinhoRestControllerBaseActionController.startAction(
            name: '_CarrinhoRestControllerBase.setMetodoPagamentoCartaoId');
    try {
      return super.setMetodoPagamentoCartaoId(value);
    } finally {
      _$_CarrinhoRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDinheiroOuCartao(bool value) {
    final _$actionInfo = _$_CarrinhoRestControllerBaseActionController
        .startAction(name: '_CarrinhoRestControllerBase.setDinheiroOuCartao');
    try {
      return super.setDinheiroOuCartao(value);
    } finally {
      _$_CarrinhoRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipoEntrega(bool value) {
    final _$actionInfo = _$_CarrinhoRestControllerBaseActionController
        .startAction(name: '_CarrinhoRestControllerBase.setTipoEntrega');
    try {
      return super.setTipoEntrega(value);
    } finally {
      _$_CarrinhoRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
salvo: ${salvo},
salvando: ${salvando},
metodoPagamentoCartaoId: ${metodoPagamentoCartaoId},
tipoEntrega: ${tipoEntrega},
taxaEntrega: ${taxaEntrega},
clienteId: ${clienteId},
pagamentoDinheiro: ${pagamentoDinheiro},
produtos: ${produtos},
trocoParaController: ${trocoParaController},
totalPedido: ${totalPedido},
liberarPedir: ${liberarPedir},
itens: ${itens},
todosItens: ${todosItens},
item: ${item}
    ''';
  }
}
