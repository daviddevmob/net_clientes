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

  final _$confirmPasswordControllerAtom =
      Atom(name: '_CriarContaControllerBase.confirmPasswordController');

  @override
  TextEditingController get confirmPasswordController {
    _$confirmPasswordControllerAtom.reportRead();
    return super.confirmPasswordController;
  }

  @override
  set confirmPasswordController(TextEditingController value) {
    _$confirmPasswordControllerAtom
        .reportWrite(value, super.confirmPasswordController, () {
      super.confirmPasswordController = value;
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

  final _$confirmEmailControllerAtom =
      Atom(name: '_CriarContaControllerBase.confirmEmailController');

  @override
  TextEditingController get confirmEmailController {
    _$confirmEmailControllerAtom.reportRead();
    return super.confirmEmailController;
  }

  @override
  set confirmEmailController(TextEditingController value) {
    _$confirmEmailControllerAtom
        .reportWrite(value, super.confirmEmailController, () {
      super.confirmEmailController = value;
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

  final _$districtAtom = Atom(name: '_CriarContaControllerBase.district');

  @override
  int get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(int value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$obscurePasswordAtom =
      Atom(name: '_CriarContaControllerBase.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$savingAtom = Atom(name: '_CriarContaControllerBase.saving');

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

  final _$saveUserAsyncAction =
      AsyncAction('_CriarContaControllerBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$_CriarContaControllerBaseActionController =
      ActionController(name: '_CriarContaControllerBase');

  @override
  dynamic changeDistrict(int newValue) {
    final _$actionInfo = _$_CriarContaControllerBaseActionController
        .startAction(name: '_CriarContaControllerBase.changeDistrict');
    try {
      return super.changeDistrict(newValue);
    } finally {
      _$_CriarContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formCreateUserKey: ${formCreateUserKey},
passwordController: ${passwordController},
confirmPasswordController: ${confirmPasswordController},
cpfController: ${cpfController},
nomeController: ${nomeController},
emailController: ${emailController},
confirmEmailController: ${confirmEmailController},
whatsappController: ${whatsappController},
district: ${district},
obscurePassword: ${obscurePassword},
saving: ${saving}
    ''';
  }
}
