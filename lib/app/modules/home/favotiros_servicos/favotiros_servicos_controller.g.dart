// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favotiros_servicos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavotirosServicosController on _FavotirosServicosControllerBase, Store {
  final _$servicosAtom =
      Atom(name: '_FavotirosServicosControllerBase.servicos');

  @override
  ServicoFavoritoModel get servicos {
    _$servicosAtom.reportRead();
    return super.servicos;
  }

  @override
  set servicos(ServicoFavoritoModel value) {
    _$servicosAtom.reportWrite(value, super.servicos, () {
      super.servicos = value;
    });
  }

  final _$getServicosAsyncAction =
      AsyncAction('_FavotirosServicosControllerBase.getServicos');

  @override
  Future getServicos(int clienteId) {
    return _$getServicosAsyncAction.run(() => super.getServicos(clienteId));
  }

  @override
  String toString() {
    return '''
servicos: ${servicos}
    ''';
  }
}
