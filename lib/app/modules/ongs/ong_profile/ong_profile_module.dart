import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';

import 'ong_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ong_profile_page.dart';

class OngProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IOng>((i) => OngRepository(i.get())),
      Bind((i) => OngProfileController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => OngProfilePage(ongSearch: args.data,)),
      ];

  static Inject get to => Inject<OngProfileModule>.of();
}
