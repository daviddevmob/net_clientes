import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';

import 'produto_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_rest_page.dart';

class ProdutoRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IRestProfile>((i) => RestProfileRepository(i.get())),
    Bind((i) => ProdutoRestController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProdutoRestPage(produto: args.data,)),
      ];

  static Inject get to => Inject<ProdutoRestModule>.of();
}
