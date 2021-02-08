import 'package:net_cliente/app/shared/repositories/ong_repository/ongs_favoritas/ongs_favoritas_repository.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ongs_favoritas/ongs_favoritas_repository_interface.dart';

import 'favotiros_ongs_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favotiros_ongs_page.dart';

class FavotirosOngsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IOngsFavoritas>((i) => OngsFavoritasRepository(i.get())),
    Bind((i) => FavotirosOngsController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FavotirosOngsPage(clienteId: args.data,)),
      ];

  static Inject get to => Inject<FavotirosOngsModule>.of();
}
