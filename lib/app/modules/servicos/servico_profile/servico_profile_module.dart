import 'package:net_cliente/app/modules/maps_view/maps_module.dart';
import 'package:net_cliente/app/modules/servicos/servico_profile/servico_avaliacoes.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servicos_favoritos/servicos_favoritos_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/view_image_galeria.dart';
import 'package:net_cliente/app/shared/utils/view_image_profile.dart';

import 'servico_profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'servico_profile_page.dart';

class ServicoProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind<IServicosFavoritos>((i) => ServicosFavoritosRepository((i.get()))),
      Bind<ISend>((i) => SendRepository(i.get())),
      Bind<IServico>((i) => ServicosRepository(i.get())),
      Bind((i) => ServicoProfileController(i.get(), i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ServicoProfilePage(baseServiceProfile: args.data,)),
        ModularRouter('/view_capa_perfil', child: (_,args) => DetalhesImagem(pathImage: args.data,)),
        ModularRouter('/view_imagens_galeria', child: (_,args) => ViewImagensGaleria(pathImage: args.data,)),
        ModularRouter('/maps_view', module: MapsViewModule()),
        ModularRouter('/ver_avaliacoes', child: (_,args) => ServicoAvaliacoesWidget(avaliacaoes: args.data,))
      ];

  static Inject get to => Inject<ServicoProfileModule>.of();
}
