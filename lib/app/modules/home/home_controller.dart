import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHome iHome;
  final ILogin iLogin;

  _HomeControllerBase(this.iHome, this.iLogin);

  @observable
  ObservableStream<ClienteModel> cliente;

  @action
  getCliente(String email) async {
    // ignore: await_only_futures
    cliente = await iHome.getCliente(email);
  }
}
