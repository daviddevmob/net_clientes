import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/modules/login/criar_conta/criar_conta_module.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) => HasuraConnect(
        'https://metacalorica.com.br/v1/graphql', 
        headers: {'x-hasura-admin-secret':'Mars20121a!'})),
      Bind<ILogin>((i) => LoginRepository(i.get(), i.get())),
      Bind((i) => LoginController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/criar_conta', module: CriarContaModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
