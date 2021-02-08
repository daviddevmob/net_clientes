import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_favorito_profile_model.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository_interface.dart';

part 'servico_profile_controller.g.dart';

@Injectable()
class ServicoProfileController = _ServicoProfileControllerBase
    with _$ServicoProfileController;

abstract class _ServicoProfileControllerBase with Store {
  final IServico iServico;
  final ISend iSend;
  final IServicosFavoritos iServicosFavoritos;

  _ServicoProfileControllerBase(this.iServico, this.iSend, this.iServicosFavoritos);

  @observable
  ServicoModel servicoUser;

  
  @observable
  ObservableStream<ServicoFavoritoModelProfile> getServico;

  @action
  getServicoFavorito(int lojaId, int clienteId) {
    getServico = iServicosFavoritos.setFavoritos(lojaId, clienteId).asObservable();
  }

  @action
  setFavorito(int lojaId, int clienteId, bool value ) async {
    await iServicosFavoritos.setStatusFavorito(clienteId,lojaId,  value);
  }

  @action
  salvarFavorito(int lojaId, int clienteId,) async {
    await iServicosFavoritos.salvarFavorito(lojaId, clienteId);
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
  sendCall(String numero) async {
    await iSend.sendLigacao(numero);
  }

  @action
  sendEmail(String email) async {
    await iSend.sendEmail(email);
  }

  @action
  getServicoUser(int userId) async {
    servicoUser = await iServico.getServico(userId);
  }
}
