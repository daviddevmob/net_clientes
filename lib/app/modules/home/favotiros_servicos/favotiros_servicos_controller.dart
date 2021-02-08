import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_favorito_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository_interface.dart';

part 'favotiros_servicos_controller.g.dart';

@Injectable()
class FavotirosServicosController = _FavotirosServicosControllerBase
    with _$FavotirosServicosController;

abstract class _FavotirosServicosControllerBase with Store {
 final IServicosFavoritos iServicosFavoritos;

  _FavotirosServicosControllerBase(this.iServicosFavoritos);

  @observable
  ServicoFavoritoModel servicos;

  @action
  getServicos(int clienteId) async {
    servicos = await iServicosFavoritos.getLojas(clienteId);
  }
  
}
