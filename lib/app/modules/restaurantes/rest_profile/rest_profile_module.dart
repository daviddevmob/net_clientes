import 'package:net_cliente/app/modules/restaurantes/rest_profile/carrinho_rest/carrinho_rest_module.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/produto_rest_module.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

import 'rest_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'rest_profile_page.dart';

class RestProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<ICarrinhoRestLocal>((i) => CarrinhoRestLocalRepository()),
    Bind<IRestFavoritos>((i) => RestsFavotirosRepository(i.get())),
    Bind<IRestProfile>((i) => RestProfileRepository(i.get())),
    Bind<ISend>((i) => SendRepository(i.get())),
    Bind((i) => RestProfileController(i.get(), i.get(), i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => RestProfilePage(rest: args.data,)),
    ModularRouter('/carrinho_rest', module: CarrinhoRestModule()),
    ModularRouter('/view_produto', module: ProdutoRestModule()),
    
      ];

  static Inject get to => Inject<RestProfileModule>.of();
}
