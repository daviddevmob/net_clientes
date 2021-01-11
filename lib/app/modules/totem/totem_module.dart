import 'totem_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'totem_page.dart';

class TotemModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) =>TotemController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TotemPage()),
      ];

  static Inject get to => Inject<TotemModule>.of();
}
