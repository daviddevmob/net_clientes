import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'totem_controller.g.dart';

@Injectable()
class TotemController = _TotemControllerBase with _$TotemController;

abstract class _TotemControllerBase with Store {
  
  @action
  sendWhatsApp(){
    
  }
}
