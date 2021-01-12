import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/modules/login/login_module.dart';
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
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_,args) => SplashPage()),
    ModularRouter('/login', module: LoginModule()),
    ModularRouter('/home', module: HomeModule()),
    ModularRouter('/servicos', module: ServicosModule()),
    ModularRouter('/restaurantes', module: RestaurantesModule()),
    ModularRouter('/ongs', module: OngsModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
