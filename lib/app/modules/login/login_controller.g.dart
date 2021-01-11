// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$formLoginKeyAtom = Atom(name: '_LoginControllerBase.formLoginKey');

  @override
  GlobalKey<FormState> get formLoginKey {
    _$formLoginKeyAtom.reportRead();
    return super.formLoginKey;
  }

  @override
  set formLoginKey(GlobalKey<FormState> value) {
    _$formLoginKeyAtom.reportWrite(value, super.formLoginKey, () {
      super.formLoginKey = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_LoginControllerBase.emailController');

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

  final _$passwordControllerAtom =
      Atom(name: '_LoginControllerBase.passwordController');

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

  final _$viewPassWordAtom = Atom(name: '_LoginControllerBase.viewPassWord');

  @override
  bool get viewPassWord {
    _$viewPassWordAtom.reportRead();
    return super.viewPassWord;
  }

  @override
  set viewPassWord(bool value) {
    _$viewPassWordAtom.reportWrite(value, super.viewPassWord, () {
      super.viewPassWord = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
formLoginKey: ${formLoginKey},
emailController: ${emailController},
passwordController: ${passwordController},
viewPassWord: ${viewPassWord}
    ''';
  }
}
