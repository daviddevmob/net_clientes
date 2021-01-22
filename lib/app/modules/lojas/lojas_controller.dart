import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/loja/list_lojas/list_lojas_repository_interface.dart';

part 'lojas_controller.g.dart';

@Injectable()
class LojasController = _LojasControllerBase with _$LojasController;

abstract class _LojasControllerBase with Store {
  final IListLojas iListLojas;
  final IGeo iGeo;

  _LojasControllerBase(this.iListLojas, this.iGeo);

  @observable
  ListLojasModel listLojas;

  @observable
  bool domicilio;

  @observable
  bool lojaFisica;

  @observable
  int categoria;

  @observable
  TextEditingController textSearch = TextEditingController();

  @action
  getDistanciaNegocio(
    double userLat,
    double userLong,
    double lat,
    double lng,
  ) {
    var distancia = iGeo.getDistacia(
      userLat,
      userLong,
      lat,
      lng,
    );
    return distancia;
  }

  @action
  getListLojas() async {
    listLojas = await iListLojas
        .getLojas(
          domicilio,
          lojaFisica,
          null,
          textSearch.text,
        )
        .asObservable();
  }
}
