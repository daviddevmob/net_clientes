// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicosController on _ServicosControllerBase, Store {
  Computed<String> _$categoriaTextComputed;

  @override
  String get categoriaText =>
      (_$categoriaTextComputed ??= Computed<String>(() => super.categoriaText,
              name: '_ServicosControllerBase.categoriaText'))
          .value;
  Computed<String> _$bairroTextComputed;

  @override
  String get bairroText =>
      (_$bairroTextComputed ??= Computed<String>(() => super.bairroText,
              name: '_ServicosControllerBase.bairroText'))
          .value;

  final _$servicosSearchModelAtom =
      Atom(name: '_ServicosControllerBase.servicosSearchModel');

  @override
  ServicosSearchModel get servicosSearchModel {
    _$servicosSearchModelAtom.reportRead();
    return super.servicosSearchModel;
  }

  @override
  set servicosSearchModel(ServicosSearchModel value) {
    _$servicosSearchModelAtom.reportWrite(value, super.servicosSearchModel, () {
      super.servicosSearchModel = value;
    });
  }

  final _$pesquisaControllerAtom =
      Atom(name: '_ServicosControllerBase.pesquisaController');

  @override
  TextEditingController get pesquisaController {
    _$pesquisaControllerAtom.reportRead();
    return super.pesquisaController;
  }

  @override
  set pesquisaController(TextEditingController value) {
    _$pesquisaControllerAtom.reportWrite(value, super.pesquisaController, () {
      super.pesquisaController = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_ServicosControllerBase.categoria');

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

  final _$bairroAtom = Atom(name: '_ServicosControllerBase.bairro');

  @override
  int get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(int value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$getServicosParamsAsyncAction =
      AsyncAction('_ServicosControllerBase.getServicosParams');

  @override
  Future getServicosParams() {
    return _$getServicosParamsAsyncAction.run(() => super.getServicosParams());
  }

  final _$getServicesAsyncAction =
      AsyncAction('_ServicosControllerBase.getServices');

  @override
  Future getServices() {
    return _$getServicesAsyncAction.run(() => super.getServices());
  }

  final _$getServicesCategoryAsyncAction =
      AsyncAction('_ServicosControllerBase.getServicesCategory');

  @override
  Future getServicesCategory(int categoria) {
    return _$getServicesCategoryAsyncAction
        .run(() => super.getServicesCategory(categoria));
  }

  final _$getServicesCategoryDistricAsyncAction =
      AsyncAction('_ServicosControllerBase.getServicesCategoryDistric');

  @override
  Future getServicesCategoryDistric(int categoria, int bairro) {
    return _$getServicesCategoryDistricAsyncAction
        .run(() => super.getServicesCategoryDistric(categoria, bairro));
  }

  final _$getServicesDistricAsyncAction =
      AsyncAction('_ServicosControllerBase.getServicesDistric');

  @override
  Future getServicesDistric(int bairro) {
    return _$getServicesDistricAsyncAction
        .run(() => super.getServicesDistric(bairro));
  }

  final _$_ServicosControllerBaseActionController =
      ActionController(name: '_ServicosControllerBase');

  @override
  dynamic selectCategoria(int newValue) {
    final _$actionInfo = _$_ServicosControllerBaseActionController.startAction(
        name: '_ServicosControllerBase.selectCategoria');
    try {
      return super.selectCategoria(newValue);
    } finally {
      _$_ServicosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectBairro(int newValue) {
    final _$actionInfo = _$_ServicosControllerBaseActionController.startAction(
        name: '_ServicosControllerBase.selectBairro');
    try {
      return super.selectBairro(newValue);
    } finally {
      _$_ServicosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicosSearchModel: ${servicosSearchModel},
pesquisaController: ${pesquisaController},
categoria: ${categoria},
bairro: ${bairro},
categoriaText: ${categoriaText},
bairroText: ${bairroText}
    ''';
  }
}
