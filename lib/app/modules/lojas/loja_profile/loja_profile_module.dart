import 'package:net_cliente/app/modules/lojas/loja_profile/carrinho_loja_page.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_perfil/loja_profile_repository.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_perfil/loja_profile_repository_interface.dart';

import 'loja_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'loja_profile_page.dart';

class LojaProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ILojaPerfil>((i) => LojaPerfilRepository(i.get())),
      Bind((i) => LojaProfileController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => LojaProfilePage(lojaProfile: args.data,)),
        ModularRouter('/carrinho_loja', child: (_,args) 
        => CarrinhoLojaPage(carrinho: args.data,),),
      ];

  static Inject get to => Inject<LojaProfileModule>.of();
}
