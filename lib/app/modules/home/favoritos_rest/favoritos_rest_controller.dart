import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favoritos_model.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository_interface.dart';

part 'favoritos_rest_controller.g.dart';

@Injectable()
class FavoritosRestController = _FavoritosRestControllerBase
    with _$FavoritosRestController;

abstract class _FavoritosRestControllerBase with Store {
  final IRestFavoritos iRestFavoritos;

  _FavoritosRestControllerBase(this.iRestFavoritos);

  @observable
  RestFavoritoModelList list;

  @action
  getRestFavoritos(int clienteId) async {
    list = await iRestFavoritos.getLojas(clienteId);
  }
}
