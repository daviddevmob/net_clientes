import 'carrinho_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_rest_page.dart';

class CarrinhoRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CarrinhoRestController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CarrinhoRestPage(carrinho: args.data,)),
      ];

  static Inject get to => Inject<CarrinhoRestModule>.of();
}
