import 'lojas_categoria_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lojas_categoria_page.dart';

class LojasCategoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) => LojasCategoriaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => LojasCategoriaPage(lojaSearch: args.data,)),
      ];

  static Inject get to => Inject<LojasCategoriaModule>.of();
}
