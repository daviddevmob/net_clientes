import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_repository_interface.dart';

import 'restaurantes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'restaurantes_page.dart';

class RestaurantesModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IRestRepository>((i) => RestRepository(i.get())),
      Bind<IGeo>((i) => GeolocalizacaoRepository(i.get())),
      Bind((i) =>RestaurantesController(i.get(),i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RestaurantesPage(restSearch: args.data,)),
      ];

  static Inject get to => Inject<RestaurantesModule>.of();
}
