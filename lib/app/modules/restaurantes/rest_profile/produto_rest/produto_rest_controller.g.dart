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

  final _$opcoesAtom = Atom(name: '_ProdutoRestControllerBase.opcoes');

  @override
  ObservableList<RestOpcaoItem> get opcoes {
    _$opcoesAtom.reportRead();
    return super.opcoes;
  }

  @override
  set opcoes(ObservableList<RestOpcaoItem> value) {
    _$opcoesAtom.reportWrite(value, super.opcoes, () {
      super.opcoes = value;
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

  final _$valueAtom = Atom(name: '_ProdutoRestControllerBase.value');

  @override
  List<double> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<double> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$getProdutoViewAsyncAction =
      AsyncAction('_ProdutoRestControllerBase.getProdutoView');

  @override
  Future getProdutoView(int produtoId, int categoriaId) {
    return _$getProdutoViewAsyncAction
        .run(() => super.getProdutoView(produtoId, categoriaId));
  }

  final _$criarRadiosAsyncAction =
      AsyncAction('_ProdutoRestControllerBase.criarRadios');

  @override
  Future criarRadios() {
    return _$criarRadiosAsyncAction.run(() => super.criarRadios());
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
opcoes: ${opcoes},
add: ${add},
value: ${value},
totalItem: ${totalItem},
adicionaisTotal: ${adicionaisTotal},
opcoesTotal: ${opcoesTotal}
    ''';
  }
}
