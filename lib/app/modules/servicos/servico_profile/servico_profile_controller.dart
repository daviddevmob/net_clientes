import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

part 'servico_profile_controller.g.dart';

@Injectable()
class ServicoProfileController = _ServicoProfileControllerBase
    with _$ServicoProfileController;

abstract class _ServicoProfileControllerBase with Store {
  final IServico iServico;

  _ServicoProfileControllerBase(this.iServico);

  @observable
  ServicoModel servicoUser;

  @action
  getServicoUser(int userId) async {
    servicoUser = await iServico.getServico(userId);
  }
}
