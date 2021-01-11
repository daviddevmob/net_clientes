import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ILogin iLogin;

  _AppControllerBase(this.iLogin);

  @action
  getUser() async {
    var currentUser = await iLogin.getCurrentCliente();
    return currentUser;
  }
}
