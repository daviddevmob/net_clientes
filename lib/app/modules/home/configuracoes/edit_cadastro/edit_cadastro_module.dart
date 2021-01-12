import 'package:net_cliente/app/shared/repositories/home_repository/home_repository.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';

import 'edit_cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'edit_cadastro_page.dart';

class EditCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IHome>((i) => HomeRepository(i.get())),
      Bind((i) => EditCadastroController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EditCadastroPage(clienteModel: args.data,)),
      ];

  static Inject get to => Inject<EditCadastroModule>.of();
}
