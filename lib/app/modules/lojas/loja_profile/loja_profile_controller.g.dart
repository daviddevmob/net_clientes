// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loja_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojaProfileController on _LojaProfileControllerBase, Store {
  Computed<int> _$filtroStringComputed;

  @override
  int get filtroString =>
      (_$filtroStringComputed ??= Computed<int>(() => super.filtroString,
              name: '_LojaProfileControllerBase.filtroString'))
          .value;
  Computed<double> _$totalPedidoComputed;

  @override
  double get totalPedido =>
      (_$totalPedidoComputed ??= Computed<double>(() => super.totalPedido,
              name: '_LojaProfileControllerBase.totalPedido'))
          .value;
  Computed<List<LojaPedidoItem>> _$pedidosItensComputed;

  @override
  List<LojaPedidoItem> get pedidosItens => (_$pedidosItensComputed ??=
          Computed<List<LojaPedidoItem>>(() => super.pedidosItens,
              name: '_LojaProfileControllerBase.pedidosItens'))
      .value;

  final _$produtosCarrinhoAtom =
      Atom(name: '_LojaProfileControllerBase.produtosCarrinho');

  @override
  ObservableList<ItemCarrinhoModel> get produtosCarrinho {
    _$produtosCarrinhoAtom.reportRead();
    return super.produtosCarrinho;
  }

  @override
  set produtosCarrinho(ObservableList<ItemCarrinhoModel> value) {
    _$produtosCarrinhoAtom.reportWrite(value, super.produtosCarrinho, () {
      super.produtosCarrinho = value;
    });
  }

  final _$lojaAtom = Atom(name: '_LojaProfileControllerBase.loja');

  @override
  LojaPerfilPageModel get loja {
    _$lojaAtom.reportRead();
    return super.loja;
  }

  @override
  set loja(LojaPerfilPageModel value) {
    _$lojaAtom.reportWrite(value, super.loja, () {
      super.loja = value;
    });
  }

  final _$clienteIdAtom = Atom(name: '_LojaProfileControllerBase.clienteId');

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

  final _$favoritadoAtom = Atom(name: '_LojaProfileControllerBase.favoritado');

  @override
  bool get favoritado {
    _$favoritadoAtom.reportRead();
    return super.favoritado;
  }

  @override
  set favoritado(bool value) {
    _$favoritadoAtom.reportWrite(value, super.favoritado, () {
      super.favoritado = value;
    });
  }

  final _$lojaFavoritaAtom =
      Atom(name: '_LojaProfileControllerBase.lojaFavorita');

  @override
  ObservableStream<LojaFavoritaModelProfile> get lojaFavorita {
    _$lojaFavoritaAtom.reportRead();
    return super.lojaFavorita;
  }

  @override
  set lojaFavorita(ObservableStream<LojaFavoritaModelProfile> value) {
    _$lojaFavoritaAtom.reportWrite(value, super.lojaFavorita, () {
      super.lojaFavorita = value;
    });
  }

  final _$formCarrinhoKeyAtom =
      Atom(name: '_LojaProfileControllerBase.formCarrinhoKey');

  @override
  GlobalKey<FormState> get formCarrinhoKey {
    _$formCarrinhoKeyAtom.reportRead();
    return super.formCarrinhoKey;
  }

  @override
  set formCarrinhoKey(GlobalKey<FormState> value) {
    _$formCarrinhoKeyAtom.reportWrite(value, super.formCarrinhoKey, () {
      super.formCarrinhoKey = value;
    });
  }

  final _$taxaEntregaAtom =
      Atom(name: '_LojaProfileControllerBase.taxaEntrega');

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

  final _$distanciaEntregaAtom =
      Atom(name: '_LojaProfileControllerBase.distanciaEntrega');

  @override
  double get distanciaEntrega {
    _$distanciaEntregaAtom.reportRead();
    return super.distanciaEntrega;
  }

  @override
  set distanciaEntrega(double value) {
    _$distanciaEntregaAtom.reportWrite(value, super.distanciaEntrega, () {
      super.distanciaEntrega = value;
    });
  }

  final _$somenteDisponiveisAtom =
      Atom(name: '_LojaProfileControllerBase.somenteDisponiveis');

  @override
  bool get somenteDisponiveis {
    _$somenteDisponiveisAtom.reportRead();
    return super.somenteDisponiveis;
  }

  @override
  set somenteDisponiveis(bool value) {
    _$somenteDisponiveisAtom.reportWrite(value, super.somenteDisponiveis, () {
      super.somenteDisponiveis = value;
    });
  }

  final _$pedidoSalvoAtom =
      Atom(name: '_LojaProfileControllerBase.pedidoSalvo');

  @override
  bool get pedidoSalvo {
    _$pedidoSalvoAtom.reportRead();
    return super.pedidoSalvo;
  }

  @override
  set pedidoSalvo(bool value) {
    _$pedidoSalvoAtom.reportWrite(value, super.pedidoSalvo, () {
      super.pedidoSalvo = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_LojaProfileControllerBase.categoria');

  @override
  int get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(int value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$salvandoDadosAtom =
      Atom(name: '_LojaProfileControllerBase.salvandoDados');

  @override
  bool get salvandoDados {
    _$salvandoDadosAtom.reportRead();
    return super.salvandoDados;
  }

  @override
  set salvandoDados(bool value) {
    _$salvandoDadosAtom.reportWrite(value, super.salvandoDados, () {
      super.salvandoDados = value;
    });
  }

  final _$produtoListAtom =
      Atom(name: '_LojaProfileControllerBase.produtoList');

  @override
  List<LojaProduto> get produtoList {
    _$produtoListAtom.reportRead();
    return super.produtoList;
  }

  @override
  set produtoList(List<LojaProduto> value) {
    _$produtoListAtom.reportWrite(value, super.produtoList, () {
      super.produtoList = value;
    });
  }

  final _$pagamentoDinheiroAtom =
      Atom(name: '_LojaProfileControllerBase.pagamentoDinheiro');

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

  final _$metodoPagamentoCartaoIdAtom =
      Atom(name: '_LojaProfileControllerBase.metodoPagamentoCartaoId');

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

  final _$entregaDomicilioAtom =
      Atom(name: '_LojaProfileControllerBase.entregaDomicilio');

  @override
  bool get entregaDomicilio {
    _$entregaDomicilioAtom.reportRead();
    return super.entregaDomicilio;
  }

  @override
  set entregaDomicilio(bool value) {
    _$entregaDomicilioAtom.reportWrite(value, super.entregaDomicilio, () {
      super.entregaDomicilio = value;
    });
  }

  final _$trocoParaControllerAtom =
      Atom(name: '_LojaProfileControllerBase.trocoParaController');

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

  final _$getLojaAsyncAction =
      AsyncAction('_LojaProfileControllerBase.getLoja');

  @override
  Future getLoja(int lojaId) {
    return _$getLojaAsyncAction.run(() => super.getLoja(lojaId));
  }

  final _$addItemCarrinhoAsyncAction =
      AsyncAction('_LojaProfileControllerBase.addItemCarrinho');

  @override
  Future addItemCarrinho(LojaProduto lojaProduto) {
    return _$addItemCarrinhoAsyncAction
        .run(() => super.addItemCarrinho(lojaProduto));
  }

  final _$removeItemCarrinhoAsyncAction =
      AsyncAction('_LojaProfileControllerBase.removeItemCarrinho');

  @override
  Future removeItemCarrinho(LojaProduto lojaProduto) {
    return _$removeItemCarrinhoAsyncAction
        .run(() => super.removeItemCarrinho(lojaProduto));
  }

  final _$savePedidoAsyncAction =
      AsyncAction('_LojaProfileControllerBase.savePedido');

  @override
  Future savePedido(LojaProfileModel lojaView, CarrinhoLojaPageModel carrinho,
      bool entrega, double taxaEntrega, double totalPedido) {
    return _$savePedidoAsyncAction.run(() => super
        .savePedido(lojaView, carrinho, entrega, taxaEntrega, totalPedido));
  }

  final _$salvarFavoritoAsyncAction =
      AsyncAction('_LojaProfileControllerBase.salvarFavorito');

  @override
  Future salvarFavorito(int lojaId) {
    return _$salvarFavoritoAsyncAction.run(() => super.salvarFavorito(lojaId));
  }

  final _$deletarFavoritoAsyncAction =
      AsyncAction('_LojaProfileControllerBase.deletarFavorito');

  @override
  Future deletarFavorito(int lojaId) {
    return _$deletarFavoritoAsyncAction
        .run(() => super.deletarFavorito(lojaId));
  }

  final _$_LojaProfileControllerBaseActionController =
      ActionController(name: '_LojaProfileControllerBase');

  @override
  dynamic getLojaFavorita(int clineteId) {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.getLojaFavorita');
    try {
      return super.getLojaFavorita(clineteId);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEntregaDomicilio(bool newValue) {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.setEntregaDomicilio');
    try {
      return super.setEntregaDomicilio(newValue);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDinheiroOuCartao(bool newValue) {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.setDinheiroOuCartao');
    try {
      return super.setDinheiroOuCartao(newValue);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMetodoPagamentoCartaoId(int newValue) {
    final _$actionInfo =
        _$_LojaProfileControllerBaseActionController.startAction(
            name: '_LojaProfileControllerBase.setMetodoPagamentoCartaoId');
    try {
      return super.setMetodoPagamentoCartaoId(newValue);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategoria(int newValue) {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.setCategoria');
    try {
      return super.setCategoria(newValue);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItemCarrinho(LojaProduto produto) {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.deleteItemCarrinho');
    try {
      return super.deleteItemCarrinho(produto);
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filtroProduto() {
    final _$actionInfo = _$_LojaProfileControllerBaseActionController
        .startAction(name: '_LojaProfileControllerBase.filtroProduto');
    try {
      return super.filtroProduto();
    } finally {
      _$_LojaProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtosCarrinho: ${produtosCarrinho},
loja: ${loja},
clienteId: ${clienteId},
favoritado: ${favoritado},
lojaFavorita: ${lojaFavorita},
formCarrinhoKey: ${formCarrinhoKey},
taxaEntrega: ${taxaEntrega},
distanciaEntrega: ${distanciaEntrega},
somenteDisponiveis: ${somenteDisponiveis},
pedidoSalvo: ${pedidoSalvo},
categoria: ${categoria},
salvandoDados: ${salvandoDados},
produtoList: ${produtoList},
pagamentoDinheiro: ${pagamentoDinheiro},
metodoPagamentoCartaoId: ${metodoPagamentoCartaoId},
entregaDomicilio: ${entregaDomicilio},
trocoParaController: ${trocoParaController},
filtroString: ${filtroString},
totalPedido: ${totalPedido},
pedidosItens: ${pedidosItens}
    ''';
  }
}
