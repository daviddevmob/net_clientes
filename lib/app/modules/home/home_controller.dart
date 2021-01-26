import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHome iHome;
  final ILogin iLogin;
  final ISend iSend;

  _HomeControllerBase(this.iHome, this.iLogin, this.iSend);

  @observable
  ObservableStream<ClienteModel> cliente;

  @observable
  GlobalKey<FormState> formCreateUserKey = GlobalKey<FormState>();

  @observable
  ObservableStream<EnderecoClienteHome> enderecoCliente;

  @observable
  TextEditingController whatsappController = TextEditingController();

  @observable
  TextEditingController cpfController = TextEditingController();

  @observable
  bool saving = false;

  @observable
  int district;

  @action
  changeDistrict(int newValue) => district = newValue;

  @action
  getEnderecoCliente() {
    enderecoCliente = iHome
        .getEnderecoClienteHome(
            cliente.value.clienteId, cliente.value.enderecoId)
        .asObservable();
  }

  @action
  sendInstagram() async {
    await iSend.sendInstagram('totem.ce');
  }

  @action
  getCliente(String email) async {
    // ignore: await_only_futures
    cliente = await iHome.getCliente(email).asObservable();
  }

  @action
  saveUser() async {
    if (formCreateUserKey.currentState.validate()) {
      if (district != null) {
        saving = true;
        var saveUser = await iLogin.attDados(
          cliente.value.clienteId,
          district,
          whatsappController.text,
          cpfController.text,
        );

        saving = false;
        return saveUser;
      }

      return 'Selecione o bairro onde mora.';
    } else {
      print(district);
      return 'Preencha corretamente os campos.';
    }
  }
}
