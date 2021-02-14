// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacoes_rest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvaliacoesRestController on _AvaliacoesRestControllerBase, Store {
  final _$restAvaliacaoAtom =
      Atom(name: '_AvaliacoesRestControllerBase.restAvaliacao');

  @override
  ObservableStream<RestAvaliacaoProfile> get restAvaliacao {
    _$restAvaliacaoAtom.reportRead();
    return super.restAvaliacao;
  }

  @override
  set restAvaliacao(ObservableStream<RestAvaliacaoProfile> value) {
    _$restAvaliacaoAtom.reportWrite(value, super.restAvaliacao, () {
      super.restAvaliacao = value;
    });
  }

  final _$_AvaliacoesRestControllerBaseActionController =
      ActionController(name: '_AvaliacoesRestControllerBase');

  @override
  dynamic getAvaliacoesRest(int restId) {
    final _$actionInfo = _$_AvaliacoesRestControllerBaseActionController
        .startAction(name: '_AvaliacoesRestControllerBase.getAvaliacoesRest');
    try {
      return super.getAvaliacoesRest(restId);
    } finally {
      _$_AvaliacoesRestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restAvaliacao: ${restAvaliacao}
    ''';
  }
}
