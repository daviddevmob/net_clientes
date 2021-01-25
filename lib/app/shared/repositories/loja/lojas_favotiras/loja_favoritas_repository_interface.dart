import 'package:net_cliente/app/shared/models/loja/loja_favoritos_model.dart';

abstract class ILojasFavoritas {
  Future<LojaFavotiraModel> getLojas(int clienteId);
}
