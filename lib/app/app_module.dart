import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/modules/login/login_module.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/item_carrinho_model.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/loja_profile_module.dart';
import 'package:net_cliente/app/modules/lojas/lojas_categoria/lojas_categoria_module.dart';
import 'package:net_cliente/app/modules/lojas/lojas_module.dart';
import 'package:net_cliente/app/modules/maps/maps_module.dart';
import 'package:net_cliente/app/modules/maps_view/maps_module.dart';
import 'package:net_cliente/app/modules/ongs/ongs_module.dart';
import 'package:net_cliente/app/modules/restaurantes/restaurantes_module.dart';
import 'package:net_cliente/app/modules/servicos/servicos_module.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/app_widget.dart';
import 'package:net_cliente/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
      Bind((i) => HasuraConnect(
        'https://metacalorica.com.br/v1/graphql', 
        headers: {'x-hasura-admin-secret':'Mars20121a!'},
            ),
          ),
      Bind<ILogin>((i) => LoginRepository(i.get())),
      Bind((i) =>AppController(i.get())),
      Bind((i) => ItemCarrinhoModel(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_,args) => SplashPage()),
    ModularRouter('/login', module: LoginModule()),
    ModularRouter('/home', module: HomeModule()),
    ModularRouter('/servicos', module: ServicosModule()),
    ModularRouter('/restaurantes', module: RestaurantesModule()),
    ModularRouter('/ongs', module: OngsModule()),
    ModularRouter('/maps', module: MapsModule()),
    ModularRouter('/maps_view', module: MapsViewModule()),
    ModularRouter('/lojas', module: LojasModule()),
    ModularRouter('/lojas_categoria', module: LojasCategoriaModule()),
    ModularRouter('/loja_profile', module: LojaProfileModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
