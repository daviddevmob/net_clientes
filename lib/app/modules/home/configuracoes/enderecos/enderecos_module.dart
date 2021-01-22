import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';

import 'enderecos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enderecos_page.dart';

class EnderecosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IGeo>((i) => GeolocalizacaoRepository(i.get())),
        Bind<IHome>((i) => HomeRepository(i.get())),
        Bind((i) => EnderecosController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EnderecosPage(cliente: args.data,)),
      ];

  static Inject get to => Inject<EnderecosModule>.of();
}
