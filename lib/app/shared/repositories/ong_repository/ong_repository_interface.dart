import 'package:net_cliente/app/shared/models/ongs/ong_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';

abstract class IOng {
  Future<OngSearchModel> getOng();
  Future<OngSearchModel> getOngBairro(int bairro);
  Future<OngModel> getOngProfile(int userId);
}
