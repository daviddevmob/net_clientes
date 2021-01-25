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
  ObservableStream<EnderecoClienteHome> enderecoCliente;

  

  @action
  getEnderecoCliente() {
    enderecoCliente = iHome
    .getEnderecoClienteHome(
      cliente.value.clienteId,
      cliente.value.enderecoId
      ).asObservable();
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
}
