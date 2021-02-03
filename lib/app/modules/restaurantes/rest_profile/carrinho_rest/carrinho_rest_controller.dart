import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'carrinho_rest_controller.g.dart';

@Injectable()
class CarrinhoRestController = _CarrinhoRestControllerBase
    with _$CarrinhoRestController;

abstract class _CarrinhoRestControllerBase with Store {
  
}
