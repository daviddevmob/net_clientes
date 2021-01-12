import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/repositories/servico_repository/servico_repository_interface.dart';

part 'restaurantes_controller.g.dart';

@Injectable()
class RestaurantesController = _RestaurantesControllerBase
    with _$RestaurantesController;

abstract class _RestaurantesControllerBase with Store {
  
}
