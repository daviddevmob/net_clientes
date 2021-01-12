// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditCadastroController on _EditCadastroControllerBase, Store {
  final _$formConfiguracoesKeyAtom =
      Atom(name: '_EditCadastroControllerBase.formConfiguracoesKey');

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
      Atom(name: '_EditCadastroControllerBase.nomeController');

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
      Atom(name: '_EditCadastroControllerBase.cpfController');

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
      Atom(name: '_EditCadastroControllerBase.whatsappController');

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

  final _$bairroAtom = Atom(name: '_EditCadastroControllerBase.bairro');

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

  final _$clienteIdAtom = Atom(name: '_EditCadastroControllerBase.clienteId');

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

  final _$savingAtom = Atom(name: '_EditCadastroControllerBase.saving');

  @override
  bool get saving {
    _$savingAtom.reportRead();
    return super.saving;
  }

  @override
  set saving(bool value) {
    _$savingAtom.reportWrite(value, super.saving, () {
      super.saving = value;
    });
  }

  final _$saveDadosAsyncAction =
      AsyncAction('_EditCadastroControllerBase.saveDados');

  @override
  Future saveDados() {
    return _$saveDadosAsyncAction.run(() => super.saveDados());
  }

  @override
  String toString() {
    return '''
formConfiguracoesKey: ${formConfiguracoesKey},
nomeController: ${nomeController},
cpfController: ${cpfController},
whatsappController: ${whatsappController},
bairro: ${bairro},
clienteId: ${clienteId},
saving: ${saving}
    ''';
  }
}
