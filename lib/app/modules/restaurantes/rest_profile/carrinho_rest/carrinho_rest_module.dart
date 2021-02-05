import 'package:net_cliente/app/modules/lojas/loja_profile/view_produto_page.dart';
import 'package:net_cliente/app/shared/utils/view_image_galeria.dart';

import 'carrinho_rest_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_rest_page.dart';

class CarrinhoRestModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CarrinhoRestController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CarrinhoRestPage(carrinho: args.data,)),
        ModularRouter('/view_foto', child: (_,args) => DetalhesImagem(pathImage: args.data,)),
      ];

  static Inject get to => Inject<CarrinhoRestModule>.of();
}
