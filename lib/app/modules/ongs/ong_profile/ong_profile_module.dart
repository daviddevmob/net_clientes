import 'package:net_cliente/app/modules/maps_view/maps_module.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/view_image_galeria.dart';
import 'package:net_cliente/app/shared/utils/view_image_profile.dart';

import 'ong_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ong_profile_page.dart';

class OngProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<ISend>((i) => SendRepository(i.get())),
      Bind<IOng>((i) => OngRepository(i.get())),
      Bind((i) => OngProfileController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => OngProfilePage(ongSearch: args.data,)),
        ModularRouter('/maps_view', module: MapsViewModule()),
        ModularRouter('/view_capa_perfil', child: (_,args) => DetalhesImagem(pathImage: args.data,)),
        ModularRouter('/view_imagens_galeria', child: (_,args) => ViewImagensGaleria(pathImage: args.data,)),
      ];

  static Inject get to => Inject<OngProfileModule>.of();
}
