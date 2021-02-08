import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ongs_favoritas/ongs_favoritas_repository_interface.dart';

part 'favotiros_ongs_controller.g.dart';

@Injectable()
class FavotirosOngsController = _FavotirosOngsControllerBase
    with _$FavotirosOngsController;

abstract class _FavotirosOngsControllerBase with Store {
  final IOngsFavoritas iOngsFavoritas;

  _FavotirosOngsControllerBase(this.iOngsFavoritas);

  @observable
  OngsFaviritasModel ongs;

  @action
  getOns(int clienteId) async {
    ongs = await iOngsFavoritas.getOngs(clienteId);
  }
  
}
