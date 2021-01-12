import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

import 'servico_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'servico_profile_page.dart';

class ServicoProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IServico>((i) => ServicosRepository(i.get())),
      Bind((i) => ServicoProfileController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ServicoProfilePage()),
      ];

  static Inject get to => Inject<ServicoProfileModule>.of();
}
