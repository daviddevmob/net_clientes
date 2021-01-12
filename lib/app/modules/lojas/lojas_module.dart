import 'lojas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lojas_page.dart';

class LojasModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) => LojasController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LojasPage()),
      ];

  static Inject get to => Inject<LojasModule>.of();
}
