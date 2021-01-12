import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_model.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

part 'ong_profile_controller.g.dart';

@Injectable()
class OngProfileController = _OngProfileControllerBase
    with _$OngProfileController;

abstract class _OngProfileControllerBase with Store {
  final IOng iOng;
  final ISend iSend;
  _OngProfileControllerBase(this.iOng, this.iSend);

  @observable
  OngModel ong;

  @action
  getOng(int userId) async {
    ong = await iOng.getOngProfile(userId);
  }

  @action
  sendWhatsApp(String numero) async {
    await iSend.sendWhats(numero);
  }

  @action
  sendInstagram(String user) async {
    await iSend.sendInstagram(user);
  }

  @action
  sendLigacao(String numero) async {
    await iSend.sendLigacao(numero);
  }

  @action
  sendEmail(String email) async {
    await iSend.sendEmail(email);
  }
}
