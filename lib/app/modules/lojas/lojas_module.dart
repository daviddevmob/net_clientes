import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/loja/list_lojas/list_lojas_repository.dart';
import 'package:net_cliente/app/shared/repositories/loja/list_lojas/list_lojas_repository_interface.dart';

import 'lojas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lojas_page.dart';

class LojasModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IGeo>((i) => GeolocalizacaoRepository(i.get())),
      Bind<IListLojas>((i) => ListLojasRepository(i.get())),
      Bind((i) => LojasController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) 
        => LojasPage(lojasSearch:args.data,)),
      ];

  static Inject get to => Inject<LojasModule>.of();
}
