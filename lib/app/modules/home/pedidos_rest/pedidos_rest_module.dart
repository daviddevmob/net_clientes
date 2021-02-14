import 'package:net_cliente/app/shared/repositories/rest_repository/pedidos_rest/pedidos_rest_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/pedidos_rest/pedidos_rest_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao/rest_avaliacao_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_avaliacao/rest_avaliacao_respository.dart';

import 'pedidos_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pedidos_rest_page.dart';

class PedidosRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IRestAvaliacao>((i) => RestAvaliacaoRepository(i.get())),
    Bind<IPedidosRest>((i) => PedidosRestRepository(i.get())),
    Bind((i) => PedidosRestController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PedidosRestPage(clienteId: args.data,)),
      ];

  static Inject get to => Inject<PedidosRestModule>.of();
}
