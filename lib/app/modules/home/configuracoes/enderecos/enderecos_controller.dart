import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/home/home_controller.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';

part 'enderecos_controller.g.dart';

@Injectable()
class EnderecosController = _EnderecosControllerBase with _$EnderecosController;

abstract class _EnderecosControllerBase with Store {
  final IHome iHome;
  final IGeo iGeo;

  _EnderecosControllerBase(this.iHome, this.iGeo);

  @observable
  ObservableStream<List<EnderecoClienteModel>> clienteEnderecos;

  @observable
  HomeController controller = Modular.get();

  @action
  getClienteEnderecos(int clienteId) {
    clienteEnderecos = iHome.getEnderecosCliente(clienteId).asObservable();
  }

  @action
  deleteLocalizacao(int enderecoId) async {
    await iGeo.deleteLocalizacaoMaps(enderecoId);
  }

  @action
  updateEnderecoPrincipal(int clienteId, int enderecoId) async {
    await iGeo.updateEnderecoPrincipal(clienteId, enderecoId);
    return 'ok';
  }
}
