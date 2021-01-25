import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/item_carrinho_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_pedido_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';

abstract class ILojaPerfil {
  Future<LojaPerfilPageModel> getLoja(int lojaId);
  Future<bool> veridicaQuantidadeProduto(int produtoId, int quantidade);
  Future<String> fazerPedido(LojaPedidoModel lojaPedidoModel, ObservableList<ItemCarrinhoModel> itens);
}
