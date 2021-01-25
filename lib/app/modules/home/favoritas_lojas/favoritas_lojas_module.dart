import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository.dart';
import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository_interface.dart';

import 'favoritas_lojas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favoritas_lojas_page.dart';

class FavoritasLojasModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ILojasFavoritas>((i) => LojasFavotirasRepository(i.get())),
      Bind((i) => FavoritasLojasController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FavoritasLojasPage(lojasSearch: args.data,)),
      ];

  static Inject get to => Inject<FavoritasLojasModule>.of();
}
