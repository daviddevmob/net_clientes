import 'package:net_cliente/app/modules/ongs/ong_profile/ong_profile_module.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';

import 'ongs_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ongs_page.dart';

class OngsModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IOng>((i) => OngRepository(i.get())),
      Bind((i) => OngsController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => OngsPage()),
        ModularRouter('/ong_profile', module: OngProfileModule()),
      ];

  static Inject get to => Inject<OngsModule>.of();
}
