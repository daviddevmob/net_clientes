import 'package:net_cliente/app/shared/repositories/loja/loja_avaliacao/loja_avaliacao_repository.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_avaliacao/loja_avaliacao_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/loja/pedidos_loja/pedidos_loja_repository.dart';
import 'package:net_cliente/app/shared/repositories/loja/pedidos_loja/pedidos_loja_repository_interface.dart';

import 'pedidos_loja_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pedidos_loja_page.dart';

class PedidosLojaModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<ILojaAvaliacao>((i) => LojaAvaliacaoRepository(i.get())),
    Bind<IPedidosLoja>((i) => PedidosLojaRepository(i.get())),
    Bind((i) => PedidosLojaController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PedidosLojaPage(clienteId: args.data,)),
      ];

  static Inject get to => Inject<PedidosLojaModule>.of();
}
