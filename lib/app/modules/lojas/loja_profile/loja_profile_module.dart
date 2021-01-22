import 'loja_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'loja_profile_page.dart';

class LojaProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) => LojaProfileController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => LojaProfilePage(lojaProfile: args.data,)),
      ];

  static Inject get to => Inject<LojaProfileModule>.of();
}
