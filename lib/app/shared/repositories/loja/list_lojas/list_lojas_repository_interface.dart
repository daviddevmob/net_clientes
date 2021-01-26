import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';

abstract class IListLojas {
  Future<ListLojasModel> getLojas(
    bool domicilio,
    bool lojaFisica,
    int categoria,
    String text,
    int bairro,
  );
}
