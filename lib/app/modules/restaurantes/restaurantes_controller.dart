import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'restaurantes_controller.g.dart';

@Injectable()
class RestaurantesController = _RestaurantesControllerBase
    with _$RestaurantesController;

abstract class _RestaurantesControllerBase with Store {
  
}
