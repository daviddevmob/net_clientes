import 'package:net_cliente/app/modules/home/configuracoes/configuracoes_module.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/pedidos_loja_module.dart';
import 'package:net_cliente/app/modules/home/widgets/view_photo_profile.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ISend>((i) => SendRepository(i.get())),
      Bind<IHome>((i) => HomeRepository(i.get())),
      Bind<ILogin>((i) => LoginRepository(i.get())),
      Bind((i) =>HomeController(
        i.get<IHome>(),
        i.get<ILogin>(),
        i.get<ISend>(),
      )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage(email: args.data,)),
        ModularRouter('/configuracoes', module: ConfiguracoesModule()),
        ModularRouter('/view_photo_profile', child: (_,args) => ViewPhotoProfile(urlPhoto: args.data,)),
        ModularRouter('/pedidos_loja', module: PedidosLojaModule()),
        /* ModularRouter('/restaurantes', module: Ong) */
      ];

  static Inject get to => Inject<HomeModule>.of();
}
