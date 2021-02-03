import 'package:net_cliente/app/shared/models/rest/list_rest.dart';

abstract class IRestRepository{
  Future<RestListModel> getRestList(
    bool domicilio,
    bool lojaFisica,
    int categoria,
    String text,
    int bairro,
  );
}