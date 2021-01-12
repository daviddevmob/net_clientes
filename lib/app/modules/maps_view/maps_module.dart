import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';

import 'maps_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'maps_page.dart';

class MapsViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IGeo>((i) => GeolocalizacaoRepository(i.get())),
      Bind((i) =>MapsController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MapsPage(localizacao: args.data,)),
      ];

  static Inject get to => Inject<MapsViewModule>.of();
}
