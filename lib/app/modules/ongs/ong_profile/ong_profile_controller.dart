import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ongs_favoritas_model_profile.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ongs_favoritas/ongs_favoritas_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

part 'ong_profile_controller.g.dart';

@Injectable()
class OngProfileController = _OngProfileControllerBase
    with _$OngProfileController;

abstract class _OngProfileControllerBase with Store {
  final IOng iOng;
  final ISend iSend;
  final IOngsFavoritas iOngsFavoritas;
  _OngProfileControllerBase(this.iOng, this.iSend, this.iOngsFavoritas);

  @observable
  OngModel ong;

  @observable
  ObservableStream<OngFavoritasProfile> ongFavorita;

  @action
  getOngFavorita(int ongId, int clienteId){
    ongFavorita = iOngsFavoritas.getOngFavorita(ongId, clienteId).asObservable();
  }

  @action
  deletarFavorito(int ongId, int clienteId, bool value) async {
    await iOngsFavoritas.setFavorito(ongId, clienteId, value);
  }

  @action
  salvarFavorito(int ongId, int clienteId) async {
    await iOngsFavoritas.salvarFavorito(ongId, clienteId);
  }

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
