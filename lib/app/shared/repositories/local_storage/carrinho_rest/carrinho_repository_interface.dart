import 'package:net_cliente/app/shared/models/rest/item_carrinho/item_carrinho_rest_model.dart';

abstract class ICarrinhoRestLocal {
  Future deleteCarrinho();
  Future addItemCarrinho(ItemCarrinhoRestModel item);
  Future deleteItemCarrinho(ItemCarrinhoRestModel item);
  Future getItensCarrinho();
}