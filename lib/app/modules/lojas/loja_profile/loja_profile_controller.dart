import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'loja_profile_controller.g.dart';

@Injectable()
class LojaProfileController = _LojaProfileControllerBase
    with _$LojaProfileController;

abstract class _LojaProfileControllerBase with Store {
  
}
