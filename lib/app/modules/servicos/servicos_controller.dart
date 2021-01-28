import 'package:flutter/cupertino.dart';
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
  TextEditingController pesquisaController = TextEditingController();

  @observable
  int categoria = 0;

  @observable
  int bairro = 0;

  @computed
  // ignore: missing_return
  String get categoriaText {
    switch (categoria) {
      case 0:
        return 'Todos';
        break;
      case 1:
        return 'Babá';
        break;
      case 2:
        return 'Eventos / Festas';
        break;
      case 3:
        return 'Informática';
        break;
      case 4:
        return 'Profissionais liberais';
        break;
      case 5:
        return 'Reparação / Conserto / Reforma';
        break;
      case 6:
        return 'Saúde / Beleza';
        break;
      case 7:
        return 'Tradução';
        break;
      case 8:
        return 'Transporte / Mudanças';
        break;
      case 9:
        return 'Turismo';
        break;
      case 10:
        return 'Outros';
        break;
    }
  }

  @computed
  // ignore: missing_return
  String get bairroText {
    switch (bairro) {
      case 0:
        return 'Todos';
        break;
      case 1:
        return 'Amador';
        break;
      case 2:
        return 'Autódromo';
        break;
      case 3:
        return 'Cararu';
        break;
      case 4:
        return 'Centro';
        break;
      case 5:
        return 'Cidade Nova';
        break;
      case 6:
        return 'Coaçu';
        break;
      case 7:
        return 'Coité';
        break;
      case 8:
        return 'Encantada';
        break;
      case 9:
        return 'Guaribas';
        break;
      case 10:
        return 'Jabuti';
        break;
      case 11:
        return 'Lagoinha';
        break;
      case 12:
        return 'Mangabeira';
        break;
      case 13:
        return 'Novo Portugal';
        break;
      case 14:
        return 'Olho D\'água';
        break;
      case 15:
        return 'Parque Havaí';
        break;
      case 16:
        return 'Pires Façanha';
        break;
      case 17:
        return 'Precabura';
        break;
      case 18:
        return 'Santa Clara';
        break;
      case 19:
        return 'Santo Antônio';
        break;
      case 20:
        return 'Tamatanduba';
        break;
      case 21:
        return 'Timbú';
        break;
      case 22:
        return 'Urucunema';
        break;
      case 23:
        return 'Vereda Tropical';
        break;
    }
  }

  @action
  getServicosParams() async {
    if (pesquisaController.text == null || pesquisaController.text == '') {
      if (categoria == 0 && bairro != 0) {
        servicosSearchModel = await iServico.getServicosBairro(bairro);
      } else if (categoria != 0 && bairro == 0) {
        servicosSearchModel = await iServico.getServicosCategoria(categoria);
      } else if (categoria != 0 && bairro != 0) {
        servicosSearchModel =
            await iServico.getServicosCategoriaBairro(categoria, bairro);
      } else {
        servicosSearchModel = await iServico.getServicos();
      }
    } else {
      if (categoria == 0 && bairro == 0) {
        servicosSearchModel = await iServico.getServicosNome(
          pesquisaController.text,
        );
      } else if (categoria == 0 && bairro != 0) {
        servicosSearchModel = await iServico.getServicosNomeBairro(
          pesquisaController.text,
          bairro,
        );
      } else if (categoria != 0 && bairro == 0) {
        servicosSearchModel = await iServico.getServicosNomeCategoria(
          pesquisaController.text,
          categoria,
        );
      } else if (categoria != 0 && bairro != 0) {
        servicosSearchModel = await iServico.getServicosNomeCategoriaBairro(
          pesquisaController.text,
          categoria,
          bairro,
        );
      }
    }
  }

  @action
  selectCategoria(int newValue) {
    categoria = newValue;
    getServicosParams();
  }

  @action
  selectBairro(int newValue) {
    bairro = newValue;
    getServicosParams();
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
