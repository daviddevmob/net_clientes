import 'package:net_cliente/app/shared/repositories/home_repository/home_repository.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IHome>((i) => HomeRepository(i.get())),
      Bind<ILogin>((i) => LoginRepository(i.get())),
      Bind((i) =>HomeController(
        i.get<IHome>(),
        i.get<ILogin>()
      )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage(email: args.data,)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
