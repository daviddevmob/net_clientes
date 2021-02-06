import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository_interface.dart';

import 'favoritos_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favoritos_rest_page.dart';

class FavoritosRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IRestFavoritos>((i) => RestsFavotirosRepository(i.get())),
    Bind((i) => FavoritosRestController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FavoritosRestPage(lojasSearch: args.data,)),
      ];

  static Inject get to => Inject<FavoritosRestModule>.of();
}
