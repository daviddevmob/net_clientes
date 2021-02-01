import 'package:net_cliente/app/modules/home/configuracoes/edit_cadastro/edit_cadastro_module.dart';
import 'package:net_cliente/app/modules/home/configuracoes/enderecos/enderecos_module.dart';
import 'package:net_cliente/app/modules/home/widgets/view_photo_profile.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';

import 'configuracoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'configuracoes_page.dart';

class ConfiguracoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ILogin>((i) => LoginRepository(i.get())),
      Bind<IHome>((i) => HomeRepository(i.get())),
      Bind((i) => ConfiguracoesController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ConfiguracoesPage(clienteModel: args.data,)),
        ModularRouter('/view_photo_profile', child: (_,args) => ViewPhotoProfile(urlPhoto: args.data)),
        ModularRouter('/edit_cadastro', module: EditCadastroModule()),
        ModularRouter('/enderecos', module: EnderecosModule()),
      ];

  static Inject get to => Inject<ConfiguracoesModule>.of();
}
