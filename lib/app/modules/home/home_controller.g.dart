// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$clienteAtom = Atom(name: '_HomeControllerBase.cliente');

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

  final _$formCreateUserKeyAtom =
      Atom(name: '_HomeControllerBase.formCreateUserKey');

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

  final _$enderecoClienteAtom =
      Atom(name: '_HomeControllerBase.enderecoCliente');

  @override
  ObservableStream<EnderecoClienteHome> get enderecoCliente {
    _$enderecoClienteAtom.reportRead();
    return super.enderecoCliente;
  }

  @override
  set enderecoCliente(ObservableStream<EnderecoClienteHome> value) {
    _$enderecoClienteAtom.reportWrite(value, super.enderecoCliente, () {
      super.enderecoCliente = value;
    });
  }

  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$whatsappControllerAtom =
      Atom(name: '_HomeControllerBase.whatsappController');

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

  final _$cpfControllerAtom = Atom(name: '_HomeControllerBase.cpfController');

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

  final _$savingAtom = Atom(name: '_HomeControllerBase.saving');

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

  final _$districtAtom = Atom(name: '_HomeControllerBase.district');

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

  final _$sendInstagramAsyncAction =
      AsyncAction('_HomeControllerBase.sendInstagram');

  @override
  Future sendInstagram() {
    return _$sendInstagramAsyncAction.run(() => super.sendInstagram());
  }

  final _$getClienteAsyncAction = AsyncAction('_HomeControllerBase.getCliente');

  @override
  Future getCliente(String email) {
    return _$getClienteAsyncAction.run(() => super.getCliente(email));
  }

  final _$saveUserAsyncAction = AsyncAction('_HomeControllerBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeDistrict(int newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeDistrict');
    try {
      return super.changeDistrict(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndexNavigator(int newIndex) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIndexNavigator');
    try {
      return super.setIndexNavigator(newIndex);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEnderecoCliente() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getEnderecoCliente');
    try {
      return super.getEnderecoCliente();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente},
formCreateUserKey: ${formCreateUserKey},
enderecoCliente: ${enderecoCliente},
index: ${index},
whatsappController: ${whatsappController},
cpfController: ${cpfController},
saving: ${saving},
district: ${district}
    ''';
  }
}
