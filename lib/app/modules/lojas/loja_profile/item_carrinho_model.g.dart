// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_carrinho_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemCarrinhoModel on _ItemCarrinhoModelBase, Store {
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_ItemCarrinhoModelBase.quantidade'))
          .value;

  final _$_quantidadeAtom = Atom(name: '_ItemCarrinhoModelBase._quantidade');

  @override
  int get _quantidade {
    _$_quantidadeAtom.reportRead();
    return super._quantidade;
  }

  @override
  set _quantidade(int value) {
    _$_quantidadeAtom.reportWrite(value, super._quantidade, () {
      super._quantidade = value;
    });
  }

  final _$addAsyncAction = AsyncAction('_ItemCarrinhoModelBase.add');

  @override
  Future add(int produtoId) {
    return _$addAsyncAction.run(() => super.add(produtoId));
  }

  final _$_ItemCarrinhoModelBaseActionController =
      ActionController(name: '_ItemCarrinhoModelBase');

  @override
  dynamic remove() {
    final _$actionInfo = _$_ItemCarrinhoModelBaseActionController.startAction(
        name: '_ItemCarrinhoModelBase.remove');
    try {
      return super.remove();
    } finally {
      _$_ItemCarrinhoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade}
    ''';
  }
}
