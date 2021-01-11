import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

import 'criar_conta_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'criar_conta_page.dart';

class CriarContaModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ILogin>((i) => LoginRepository(i.get())),
      Bind((i) => CriarContaController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CriarContaPage()),
      ];

  static Inject get to => Inject<CriarContaModule>.of();
}
