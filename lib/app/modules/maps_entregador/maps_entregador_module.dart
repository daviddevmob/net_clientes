import 'package:net_cliente/app/shared/repositories/entregador_repository/entregador_repository.dart';
import 'package:net_cliente/app/shared/repositories/entregador_repository/entregador_repository_interface.dart';

import 'maps_entregador_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'maps_entregador_page.dart';

class MapsEntregadorModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IEntregador>((i) => EntregadorRepository(i.get())),
    Bind((i) => MapsEntregadorController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MapsEntregadorPage(entregador: args.data,)),
      ];

  static Inject get to => Inject<MapsEntregadorModule>.of();
}
