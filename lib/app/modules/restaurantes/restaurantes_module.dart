import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

import 'restaurantes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'restaurantes_page.dart';

class RestaurantesModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) =>RestaurantesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RestaurantesPage()),
      ];

  static Inject get to => Inject<RestaurantesModule>.of();
}
