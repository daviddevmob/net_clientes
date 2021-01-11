import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

part 'criar_conta_controller.g.dart';

@Injectable()
class CriarContaController = _CriarContaControllerBase
    with _$CriarContaController;

abstract class _CriarContaControllerBase with Store {
  final ILogin iLogin;

  _CriarContaControllerBase(this.iLogin);

  @observable
  GlobalKey<FormState> formCreateUserKey = GlobalKey<FormState>();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController bairroController = TextEditingController();

  @observable
  TextEditingController cpfController = TextEditingController();

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController whatsappController = TextEditingController();

  @action
  saveUser() async {
    if (formCreateUserKey.currentState.validate()) {
      var saveUser = await iLogin.createCliente(
        ClienteModel(
          bairro: bairroController.text,
          cpf: cpfController.text,
          nome: nomeController.text,
          email: emailController.text,
          whatsapp: whatsappController.text,
        ),
        passwordController.text,
      );

      return saveUser;
    }
  }
}
