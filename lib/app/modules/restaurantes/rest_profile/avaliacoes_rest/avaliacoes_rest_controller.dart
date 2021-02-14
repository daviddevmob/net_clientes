import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/rest_avaliacao/rest_avaliacao_profile.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao_profile/rest_avaliacao_profile_repository.dart';

part 'avaliacoes_rest_controller.g.dart';

@Injectable()
class AvaliacoesRestController = _AvaliacoesRestControllerBase
    with _$AvaliacoesRestController;

abstract class _AvaliacoesRestControllerBase with Store {
  final RestAvaliacaoRepository restAvaliacaoRepository;

  _AvaliacoesRestControllerBase(this.restAvaliacaoRepository);

  @observable
  ObservableStream<RestAvaliacaoProfile> restAvaliacao;

  @action
  getAvaliacoesRest(int restId)  {
    restAvaliacao = restAvaliacaoRepository.getRestAvaliacaoProfile(restId).asObservable();
  }

}
