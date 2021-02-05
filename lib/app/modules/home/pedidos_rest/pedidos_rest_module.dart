import 'pedidos_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pedidos_rest_page.dart';

class PedidosRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PedidosRestController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PedidosRestPage()),
      ];

  static Inject get to => Inject<PedidosRestModule>.of();
}
