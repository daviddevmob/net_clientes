// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracoesController on _ConfiguracoesControllerBase, Store {
  final _$imageProfileAtom =
      Atom(name: '_ConfiguracoesControllerBase.imageProfile');

  @override
  File get imageProfile {
    _$imageProfileAtom.reportRead();
    return super.imageProfile;
  }

  @override
  set imageProfile(File value) {
    _$imageProfileAtom.reportWrite(value, super.imageProfile, () {
      super.imageProfile = value;
    });
  }

  final _$clienteAtom = Atom(name: '_ConfiguracoesControllerBase.cliente');

  @override
  ObservableStream<ClienteModel> get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ObservableStream<ClienteModel> value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$testeImagemAtom =
      Atom(name: '_ConfiguracoesControllerBase.testeImagem');

  @override
  bool get testeImagem {
    _$testeImagemAtom.reportRead();
    return super.testeImagem;
  }

  @override
  set testeImagem(bool value) {
    _$testeImagemAtom.reportWrite(value, super.testeImagem, () {
      super.testeImagem = value;
    });
  }

  final _$formConfiguracoesKeyAtom =
      Atom(name: '_ConfiguracoesControllerBase.formConfiguracoesKey');

  @override
  GlobalKey<FormState> get formConfiguracoesKey {
    _$formConfiguracoesKeyAtom.reportRead();
    return super.formConfiguracoesKey;
  }

  @override
  set formConfiguracoesKey(GlobalKey<FormState> value) {
    _$formConfiguracoesKeyAtom.reportWrite(value, super.formConfiguracoesKey,
        () {
      super.formConfiguracoesKey = value;
    });
  }

  final _$nomeControllerAtom =
      Atom(name: '_ConfiguracoesControllerBase.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  final _$cpfControllerAtom =
      Atom(name: '_ConfiguracoesControllerBase.cpfController');

  @override
  TextEditingController get cpfController {
    _$cpfControllerAtom.reportRead();
    return super.cpfController;
  }

  @override
  set cpfController(TextEditingController value) {
    _$cpfControllerAtom.reportWrite(value, super.cpfController, () {
      super.cpfController = value;
    });
  }

  final _$whatsappControllerAtom =
      Atom(name: '_ConfiguracoesControllerBase.whatsappController');

  @override
  TextEditingController get whatsappController {
    _$whatsappControllerAtom.reportRead();
    return super.whatsappController;
  }

  @override
  set whatsappController(TextEditingController value) {
    _$whatsappControllerAtom.reportWrite(value, super.whatsappController, () {
      super.whatsappController = value;
    });
  }

  final _$bairroAtom = Atom(name: '_ConfiguracoesControllerBase.bairro');

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

  final _$clienteIdAtom = Atom(name: '_ConfiguracoesControllerBase.clienteId');

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

  final _$getClienteAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.getCliente');

  @override
  Future getCliente(String email) {
    return _$getClienteAsyncAction.run(() => super.getCliente(email));
  }

  final _$updateImageProfileAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.updateImageProfile');

  @override
  Future updateImageProfile() {
    return _$updateImageProfileAsyncAction
        .run(() => super.updateImageProfile());
  }

  final _$saveDadosAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.saveDados');

  @override
  Future saveDados() {
    return _$saveDadosAsyncAction.run(() => super.saveDados());
  }

  final _$saveImageProfileAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.saveImageProfile');

  @override
  Future saveImageProfile(File imageProfile, int clienteId) {
    return _$saveImageProfileAsyncAction
        .run(() => super.saveImageProfile(imageProfile, clienteId));
  }

  @override
  String toString() {
    return '''
imageProfile: ${imageProfile},
cliente: ${cliente},
testeImagem: ${testeImagem},
formConfiguracoesKey: ${formConfiguracoesKey},
nomeController: ${nomeController},
cpfController: ${cpfController},
whatsappController: ${whatsappController},
bairro: ${bairro},
clienteId: ${clienteId}
    ''';
  }
}
