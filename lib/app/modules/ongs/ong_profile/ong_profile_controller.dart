import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_model.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';

part 'ong_profile_controller.g.dart';

@Injectable()
class OngProfileController = _OngProfileControllerBase
    with _$OngProfileController;

abstract class _OngProfileControllerBase with Store {
  final IOng iOng;

  _OngProfileControllerBase(this.iOng);

  @observable
  OngModel ong;

  @action
  getOng(int userId) async {
   ong = await iOng.getOngProfile(userId);
  }
}
