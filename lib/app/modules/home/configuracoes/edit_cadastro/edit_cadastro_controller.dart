import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';

part 'edit_cadastro_controller.g.dart';

@Injectable()
class EditCadastroController = _EditCadastroControllerBase
    with _$EditCadastroController;

abstract class _EditCadastroControllerBase with Store {
  final IHome iHome;

  _EditCadastroControllerBase(this.iHome);

  @observable
  GlobalKey<FormState> formConfiguracoesKey = GlobalKey<FormState>();

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  TextEditingController cpfController = TextEditingController();

  @observable
  TextEditingController whatsappController = TextEditingController();

  @observable
  int bairro;

  @observable
  int clienteId;

  @observable
  bool saving = false;

  @action
  saveDados() async {
    if (formConfiguracoesKey.currentState.validate()) {
      var save = await iHome.updateCliente(
        ClienteModel(
          nome: nomeController.text,
          whatsapp: whatsappController.text,
          bairro: bairro,
          clienteId: clienteId,
        ),
      );

      return save;
    } else {
      return 'Formulário não pode ficar em branco.';
    }
  }
}
