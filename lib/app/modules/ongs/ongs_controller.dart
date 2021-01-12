import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/repositories/ong_repository/ong_repository_interface.dart';

part 'ongs_controller.g.dart';

@Injectable()
class OngsController = _OngsControllerBase with _$OngsController;

abstract class _OngsControllerBase with Store {
  final IOng iOng;

  _OngsControllerBase(this.iOng) {
    getOng();
  }

  @observable
  OngSearchModel ong;

  @observable
  int bairro = 0;

  @action
  setBairro(int newValue) {
    if (newValue == 0) {
      bairro = newValue;
      getOng();
    } else if (newValue != 0) {
      bairro = newValue;
      getOngBairro(newValue);
    }
  }

  @action
  getOng() async {
    ong = await iOng.getOng();
  }

  @action
  getOngBairro(int bairro) async {
    ong = await iOng.getOngBairro(bairro);
  }
}
