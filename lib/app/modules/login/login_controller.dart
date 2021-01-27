import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILogin iLogin;

  _LoginControllerBase(this.iLogin);

  @observable
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool viewPassWord = false;

  @observable
  int metodoLogin = 0;

  @computed
  int get metodo {
    if (metodoLogin == 0) {
      return 0;
    }
    
    return 1;
  }

  @observable
  bool loading = false;

  // ignore: missing_return
  String validatorPassword(password) {
    if (passwordController.text == null || passwordController.text == '') {
      return 'Campo obrigatório';
    }
    if (passwordController.text.length < 6) {
      return 'Senha inválida';
    }
  }

  @action
  login() async {
    if (formLoginKey.currentState.validate()) {
      loading = true;
      var login = await iLogin.loginCliente(
          emailController.text, passwordController.text);
      loading = false;
      return login;
    } else {
      return 'Preencha corretamente os campos.';
    }
  }

  @action
  loginGoogle() async {
    loading = true;
    String loginGoogle = await iLogin.verificarGoogle();
    loading = false;
    return loginGoogle;
  }
}
