import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao_profile/rest_avaliacao_profile_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao_profile/rest_avaliacao_profile_repository_interface.dart';

import 'avaliacoes_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'avaliacoes_rest_page.dart';

class AvaliacoesRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IRestAvaliacaoProfile>((i) => RestAvaliacaoRepository(i.get())),
    Bind((i) => AvaliacoesRestController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AvaliacoesRestPage(restId: args.data,)),
      ];

  static Inject get to => Inject<AvaliacoesRestModule>.of();
}
