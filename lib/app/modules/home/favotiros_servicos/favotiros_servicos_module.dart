import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository_interface.dart';

import 'favotiros_servicos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favotiros_servicos_page.dart';

class FavotirosServicosModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IServicosFavoritos>((i) => ServicosFavoritosRepository(i.get())),
    Bind((i) => FavotirosServicosController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FavotirosServicosPage(clienteId: args.data,)),
      ];

  static Inject get to => Inject<FavotirosServicosModule>.of();
}
