import 'package:net_cliente/app/shared/repositories/entregador_loja_repository/entregador_loja_repository.dart';
import 'package:net_cliente/app/shared/repositories/entregador_loja_repository/entregador_loja_repository_interface.dart';

import 'maps_loja_entregador_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'maps_loja_entregador_page.dart';

class MapsLojaEntregadorModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IEntregadorLoja>((i) => EntregadorLojaRepository(i.get())),
    Bind((i) => MapsLojaEntregadorController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MapsLojaEntregadorPage(entregadorModel: args.data,)),
      ];

  static Inject get to => Inject<MapsLojaEntregadorModule>.of();
}
