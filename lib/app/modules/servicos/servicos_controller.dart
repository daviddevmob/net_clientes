import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

part 'servicos_controller.g.dart';

@Injectable()
class ServicosController = _ServicosControllerBase with _$ServicosController;

abstract class _ServicosControllerBase with Store {
  final IServico iServico;

  _ServicosControllerBase(this.iServico) {
    getServices();
  }

  @observable
  ServicosSearchModel servicosSearchModel;

  @observable
  int categoria = 0;

  @observable
  int bairro = 0;

  @action
  selectCategoria(int newValue) {
    if (newValue == 0 && bairro == 0) {
      categoria = newValue;
      getServices();
    } else if (newValue != 0 && bairro == 0) {
      categoria = newValue;
      getServicesCategory(newValue);
    } else if (newValue == 0 && bairro != 0) {
      categoria = newValue;
      getServicesDistric(bairro);
    } else if (newValue != 0 && bairro != 0) {
      categoria = newValue;
      getServicesCategoryDistric(categoria, bairro);
    }
  }

  @action
  selectBairro(int newValue) {
    if (newValue == 0 && categoria == 0) {
      bairro = newValue;
      getServices();
    } else if (newValue == 0 && categoria != 0) {
      bairro = newValue;
      getServicesCategory(categoria);
    } else if (newValue != 0 && categoria == 0) {
      bairro = newValue;
      getServicesDistric(bairro);
    } else if (newValue != 0 && categoria != 0) {
      bairro = newValue;
      getServicesCategoryDistric(categoria, newValue);
    }
  }

  @action
  getServices() async {
    servicosSearchModel = await iServico.getServicos();
  }

  @action
  getServicesCategory(int categoria) async {
    servicosSearchModel = await iServico.getServicosCategoria(categoria);
  }

  @action
  getServicesCategoryDistric(int categoria, int bairro) async {
    servicosSearchModel =
        await iServico.getServicosCategoriaBairro(categoria, bairro);
  }

  @action
  getServicesDistric(int bairro) async {
    servicosSearchModel = await iServico.getServicosBairro(bairro);
  }
}
