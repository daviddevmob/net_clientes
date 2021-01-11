// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criar_conta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CriarContaController on _CriarContaControllerBase, Store {
  final _$formCreateUserKeyAtom =
      Atom(name: '_CriarContaControllerBase.formCreateUserKey');

  @override
  GlobalKey<FormState> get formCreateUserKey {
    _$formCreateUserKeyAtom.reportRead();
    return super.formCreateUserKey;
  }

  @override
  set formCreateUserKey(GlobalKey<FormState> value) {
    _$formCreateUserKeyAtom.reportWrite(value, super.formCreateUserKey, () {
      super.formCreateUserKey = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_CriarContaControllerBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$bairroControllerAtom =
      Atom(name: '_CriarContaControllerBase.bairroController');

  @override
  TextEditingController get bairroController {
    _$bairroControllerAtom.reportRead();
    return super.bairroController;
  }

  @override
  set bairroController(TextEditingController value) {
    _$bairroControllerAtom.reportWrite(value, super.bairroController, () {
      super.bairroController = value;
    });
  }

  final _$cpfControllerAtom =
      Atom(name: '_CriarContaControllerBase.cpfController');

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

  final _$nomeControllerAtom =
      Atom(name: '_CriarContaControllerBase.nomeController');

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

  final _$emailControllerAtom =
      Atom(name: '_CriarContaControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$whatsappControllerAtom =
      Atom(name: '_CriarContaControllerBase.whatsappController');

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

  final _$saveUserAsyncAction =
      AsyncAction('_CriarContaControllerBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  @override
  String toString() {
    return '''
formCreateUserKey: ${formCreateUserKey},
passwordController: ${passwordController},
bairroController: ${bairroController},
cpfController: ${cpfController},
nomeController: ${nomeController},
emailController: ${emailController},
whatsappController: ${whatsappController}
    ''';
  }
}
