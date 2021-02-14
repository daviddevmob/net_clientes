import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/list_rest.dart';
import 'package:net_cliente/app/shared/repositories/geolocaliacao/geo_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_repository_interface.dart';

part 'restaurantes_controller.g.dart';

@Injectable()
class RestaurantesController = _RestaurantesControllerBase
    with _$RestaurantesController;

abstract class _RestaurantesControllerBase with Store {
  final IRestRepository iRestRepository;
  final IGeo iGeo;

  _RestaurantesControllerBase(this.iRestRepository, this.iGeo);

  @observable
  ObservableStream<RestListModel> rests;

  @observable
  bool domicilio;

  @observable
  bool lojaFisica;

  @observable
  int bairro = 0;

  @observable
  int categoria = 0;

  @observable
  TextEditingController textSearch = TextEditingController();

  @action
  getBairro(int newValue) {
    bairro = newValue;
    getListRests();
  }

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
  getListRests() {
    rests =  iRestRepository.getRestList(
      domicilio, 
      lojaFisica, 
      categoria == 0 ? null : categoria, 
      textSearch.text, 
      bairro == 0 ? null : bairro,
      ).asObservable();
  }

  @action
  setCategoriaRests(int newValue) {
    categoria = newValue;
    print('att');
    getListRests();
  }

}
