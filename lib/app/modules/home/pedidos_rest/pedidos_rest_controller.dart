import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pedidos_rest_controller.g.dart';

@Injectable()
class PedidosRestController = _PedidosRestControllerBase
    with _$PedidosRestController;

abstract class _PedidosRestControllerBase with Store {
 
}
