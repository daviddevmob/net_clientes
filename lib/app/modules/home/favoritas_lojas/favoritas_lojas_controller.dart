import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favoritos_model.dart';
import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository_interface.dart';

part 'favoritas_lojas_controller.g.dart';

@Injectable()
class FavoritasLojasController = _FavoritasLojasControllerBase
    with _$FavoritasLojasController;

abstract class _FavoritasLojasControllerBase with Store {
  final ILojasFavoritas iLojasFavoritas;

  _FavoritasLojasControllerBase(this.iLojasFavoritas);

  @observable
  LojaFavotiraModel list;

  @action
  getLojas(int clienteId) async {
    list = await iLojasFavoritas.getLojas(clienteId).asObservable();
  }
}
