import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

import 'servicos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'servicos_page.dart';

class ServicosModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IServico>((i) => ServicosRepository(i.get())),
      Bind((i) => ServicosController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ServicosPage()),
      ];

  static Inject get to => Inject<ServicosModule>.of();
}
