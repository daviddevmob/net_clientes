// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoRestController on _ProdutoRestControllerBase, Store {
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
value: ${value}
    ''';
  }
}
