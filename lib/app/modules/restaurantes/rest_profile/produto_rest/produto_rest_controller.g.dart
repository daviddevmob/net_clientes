// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoRestController on _ProdutoRestControllerBase, Store {
  Computed<double> _$totalItemComputed;

  @override
  double get totalItem =>
      (_$totalItemComputed ??= Computed<double>(() => super.totalItem,
              name: '_ProdutoRestControllerBase.totalItem'))
          .value;
  Computed<double> _$adicionaisTotalComputed;

  @override
  double get adicionaisTotal => (_$adicionaisTotalComputed ??= Computed<double>(
          () => super.adicionaisTotal,
          name: '_ProdutoRestControllerBase.adicionaisTotal'))
      .value;
  Computed<double> _$opcoesTotalComputed;

  @override
  double get opcoesTotal =>
      (_$opcoesTotalComputed ??= Computed<double>(() => super.opcoesTotal,
              name: '_ProdutoRestControllerBase.opcoesTotal'))
          .value;

  final _$produtoAtom = Atom(name: '_ProdutoRestControllerBase.produto');

  @override
  RestProdutoProfile get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(RestProdutoProfile value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  final _$itemAtom = Atom(name: '_ProdutoRestControllerBase.item');

  @override
  List<RestOpcao> get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(List<RestOpcao> value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$addAtom = Atom(name: '_ProdutoRestControllerBase.add');

  @override
  ObservableList<RestAdicional> get add {
    _$addAtom.reportRead();
    return super.add;
  }

  @override
  set add(ObservableList<RestAdicional> value) {
    _$addAtom.reportWrite(value, super.add, () {
      super.add = value;
    });
  }

  final _$opcoesEscolhidasAtom =
      Atom(name: '_ProdutoRestControllerBase.opcoesEscolhidas');

  @override
  ObservableList<OpcaoEscolhida> get opcoesEscolhidas {
    _$opcoesEscolhidasAtom.reportRead();
    return super.opcoesEscolhidas;
  }

  @override
  set opcoesEscolhidas(ObservableList<OpcaoEscolhida> value) {
    _$opcoesEscolhidasAtom.reportWrite(value, super.opcoesEscolhidas, () {
      super.opcoesEscolhidas = value;
    });
  }

  final _$getProdutoViewAsyncAction =
      AsyncAction('_ProdutoRestControllerBase.getProdutoView');

  @override
  Future getProdutoView(int produtoId, int categoriaId) {
    return _$getProdutoViewAsyncAction
        .run(() => super.getProdutoView(produtoId, categoriaId));
  }

  final _$addItemCarrinhoAsyncAction =
      AsyncAction('_ProdutoRestControllerBase.addItemCarrinho');

  @override
  Future addItemCarrinho(int produtoId) {
    return _$addItemCarrinhoAsyncAction
        .run(() => super.addItemCarrinho(produtoId));
  }

  @override
  String toString() {
    return '''
produto: ${produto},
item: ${item},
add: ${add},
opcoesEscolhidas: ${opcoesEscolhidas},
totalItem: ${totalItem},
adicionaisTotal: ${adicionaisTotal},
opcoesTotal: ${opcoesTotal}
    ''';
  }
}
